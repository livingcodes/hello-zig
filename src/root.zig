const std = @import("std");
const testing = std.testing;

export fn add(a: i32, b: i32) i32 {
  return a + b;
}

fn out() !void {
  const stdout_file = std.io.getStdOut().writer();
  var bw = std.io.bufferedWriter(stdout_file);
  const stdout = bw.writer();
  try stdout.print("Run `zig build test` to run the tests.\n", .{});
  try bw.flush();
}

test "basic add functionality" {
  try testing.expect(add(3, 7) == 10);
}

test "simple test" {
  var list = std.ArrayList(i32).init(std.testing.allocator);
  defer list.deinit(); // comment out and see if zig detects the memory leak
  try list.append(42);
  try std.testing.expectEqual(@as(i32, 42), list.pop());
}
