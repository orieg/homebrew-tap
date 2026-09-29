# typed: false
# frozen_string_literal: true

# Rendered by scripts/update_homebrew_formula.py at release time; the template
# lives in github.com/orieg/expanse at extra/homebrew/expanse.rb.in.
class Expanse < Formula
  desc "Judy-array digital tries in Rust, with a drop-in libjudy C ABI"
  homepage "https://github.com/orieg/expanse"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/orieg/expanse/releases/download/v0.9.1/expanse-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "e5d54413ffa4b6d1470f02591d371a9cb17912a6f5c4cb21d8feb8c212b40194"
    end
    on_intel do
      url "https://github.com/orieg/expanse/releases/download/v0.9.1/expanse-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "b57afeffef7ee357f683a5e6a4b69a78489c63d7208a888dfab3385a5a3642af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/orieg/expanse/releases/download/v0.9.1/expanse-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3244443e66795eb157c154c62aff9fbf29a4261d4349c7d8bea379952cb52cc"
    end
    on_intel do
      url "https://github.com/orieg/expanse/releases/download/v0.9.1/expanse-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1689a091fef82d6bdc0cc32296e0952f5b1c1cdb38b04cabe467e3d1ff1d07a"
    end
  end

  conflicts_with "judy", because: "both install Judy.h and a libJudy library"

  def install
    include.install Dir["include/*"]
    lib.install Dir["lib/*"]
    man3.install Dir["share/man/man3/*"]

    # libjudy-compat: `-lJudy` resolves to libexpanse, as the Debian and RPM
    # libjudy-compat packages arrange it.
    lib.install_symlink "libexpanse.a" => "libJudy.a"
    if OS.mac?
      lib.install_symlink "libexpanse.dylib" => "libJudy.dylib"
    else
      lib.install_symlink "libexpanse.so.1" => "libJudy.so.1"
      lib.install_symlink "libexpanse.so" => "libJudy.so"
    end

    %w[expanse judy].each do |pc|
      description = (pc == "expanse") ? "Expanse trie engine C-API" : "Expanse libjudy compat C-API"
      (lib/"pkgconfig/#{pc}.pc").write <<~EOS
        prefix=#{opt_prefix}
        exec_prefix=${prefix}
        libdir=${exec_prefix}/lib
        includedir=${prefix}/include

        Name: #{pc}
        Description: #{description}
        Version: #{version}
        Libs: -L${libdir} -lexpanse
        Cflags: -I${includedir}
      EOS
    end
  end

  test do
    (testpath/"modern.c").write <<~EOS
      #include <expanse.h>
      #include <stdio.h>
      int main(void) {
        expanse_map_t *map = expanse_map_new();
        expanse_word_t value = 0;
        if (!map) return 1;
        expanse_map_insert(map, 42, 4242, NULL);
        if (!expanse_map_get(map, 42, &value) || value != 4242) return 2;
        if (expanse_map_get(map, 7, &value)) return 3;
        expanse_map_free(map);
        printf("%s\\n", expanse_version());
        return 0;
      }
    EOS
    system ENV.cc, "modern.c", "-I#{include}", "-L#{lib}", "-lexpanse", "-o", "modern"
    assert_match version.to_s, shell_output("./modern")

    (testpath/"legacy.c").write <<~EOS
      #include <Judy.h>
      int main(void) {
        Pvoid_t array = (Pvoid_t) NULL;
        PWord_t slot;
        Word_t freed;
        JLI(slot, array, 42);
        if (!slot) return 1;
        *slot = 4242;
        JLG(slot, array, 42);
        if (!slot || *slot != 4242) return 2;
        JLFA(freed, array);
        return freed ? 0 : 3;
      }
    EOS
    system ENV.cc, "legacy.c", "-I#{include}", "-L#{lib}", "-lJudy", "-o", "legacy"
    system "./legacy"
  end
end
