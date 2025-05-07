const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    inline for (crachme_src) |src| {
        const exe = b.addExecutable(.{
            .name = src,
            .root_module = b.createModule(.{
                .root_source_file = b.path("src/main.zig"),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
            }),
        });
        exe.pie = false;
        exe.addCSourceFile(.{
            .file = b.path("src" ++ std.fs.path.sep_str ++ src ++ ".c"),
            .flags = &.{"-fno-stack-protector"},
        });
        b.installArtifact(exe);
    }
}

const crachme_src = [_][]const u8{
    "crackme0x00",
    "crackme0x01",
    "crackme0x02",
    "crackme0x03",
    "crackme0x04",
    "crackme0x05",
    "crackme0x06",
    "crackme0x07",
    "crackme0x08",
    "crackme0x09",
};
