from conans import ConanFile


class Git2Conan(ConanFile):
    name = "git2"
    version = "0.28.2"
    url = "https://github.com/Esri/libgit2/tree/runtimecore"
    license = "https://github.com/Esri/libgit2/blob/runtimecore/COPYING"
    description = "A cross-platform, linkable library implementation of Git that you can use in your application."

    # RTC specific triple
    settings = "platform_architecture_target"

    def package(self):
        base = self.source_folder + "/"
        relative = "3rdparty/libgit2/"

        # headers
        self.copy("*.h*", src=base + "include", dst=relative + "include")

        # libraries
        output = "output/" + str(self.settings.platform_architecture_target) + "/staticlib"
        self.copy("*" + self.name + "*", src=base + "../../" + output, dst=output)
