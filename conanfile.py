from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout
import os
import shutil


class fooRecipe(ConanFile):
    name = "foo"
    version = "0.1.0"
    package_type = "library"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}
    exports_sources = "CMakeLists.txt", "src/*", "include/*"
    generators = "CMakeToolchain"
    implements = ["auto_shared_fpic"]

    def layout(self):
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
        shutil.copyfile(os.path.join(self.package_folder, "lib", "libfoo.a"), os.path.join(self.package_folder, "lib", "libcore.a"))
        shutil.copyfile(os.path.join(self.package_folder, "lib", "libfoo.a"), os.path.join(self.package_folder, "lib", "libbaz.a"))

    def package_info(self):
        self.cpp_info.libs = ["foo", "core", "baz", "foo"]
