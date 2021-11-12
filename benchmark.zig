const zort = @import("zort");
const std = @import("std");
const mem = std.mem;
const process = std.process;
const testing = std.testing;
const sort = std.sort;

fn e(a: []const u8, b: []const u8) bool {
    return mem.eql(u8, a, b);
}

pub fn main() !void {
    const args = try process.argsAlloc(testing.allocator);
    defer process.argsFree(testing.allocator, args);
    for (args[1..]) |arg| {
        var alg: zort.Algorithm = undefined;
        if (e(arg, "bubble"))
            alg = .Bubble
        else if (e(arg, "quick"))
            alg = .Quick
        else if (e(arg, "insertion"))
            alg = .Insertion
        else if (e(arg, "selection"))
            alg = .Selection
        else if (e(arg, "comb"))
            alg = .Comb
        else if (e(arg, "shell"))
            alg = .Shell
        else if (e(arg, "heap"))
            alg = .Heap
        else if (e(arg, "merge"))
            alg = .Merge
        else if (e(arg, "radix"))
            alg = .Radix
        else if (e(arg, "std_block")) {
            sort.sort(@TypeOf(items[0]), &items, {}, comptime sort.asc(@TypeOf(items[0])));
            return;
        } else if (e(arg, "std_insertion")) {
            sort.insertionSort(@TypeOf(items[0]), &items, {}, comptime sort.asc(@TypeOf(items[0])));
            return;
        } else {
            std.debug.print("\nfailed\n", .{});
            return;
        }

        try zort.sort(@TypeOf(items[0]), &items, false, alg, testing.allocator);
    }
}

pub var items = [_]i32{ 83, 442, 454, 537, 998, 2, 103, 501, 560, 603, 9, 146, 538, 547, 657, 8, 89, 207, 428, 603, 66, 370, 423, 463, 904, 5, 315, 641, 683, 842, 3, 564, 567, 597, 599, 72, 394, 497, 573, 625, 163, 595, 916, 954, 315, 350, 554, 617, 864, 78, 468, 699, 709, 944, 108, 189, 238, 511, 528, 16, 223, 413, 437, 935, 104, 271, 428, 764, 803, 148, 160, 250, 476, 620, 351, 679, 797, 949, 955, 149, 557, 564, 588, 636, 143, 228, 552, 759, 907, 295, 363, 410, 436, 808, 113, 149, 425, 915, 947, 624, 748, 773, 878, 910, 164, 275, 409, 569, 826, 75, 90, 369, 379, 561, 33, 159, 790, 792, 939, 124, 169, 278, 317, 554, 302, 437, 447, 591, 936, 390, 542, 607, 937, 972, 6, 111, 358, 564, 819, 76, 395, 809, 945, 994, 69, 71, 696, 797, 963, 93, 440, 526, 822, 828, 25, 407, 583, 742, 775, 68, 478, 807, 872, 910, 107, 165, 558, 796, 996, 58, 576, 815, 860, 897, 72, 186, 225, 245, 935, 18, 24, 177, 639, 767, 59, 83, 676, 712, 981, 170, 177, 285, 319, 460, 148, 367, 461, 468, 791, 308, 311, 512, 521, 674, 118, 143, 352, 509, 778, 66, 71, 524, 965, 968, 195, 203, 274, 603, 616, 122, 317, 533, 677, 716, 249, 671, 683, 703, 801, 103, 587, 692, 752, 933, 143, 267, 392, 725, 998, 21, 137, 426, 936, 982, 206, 586, 781, 875, 985, 18, 59, 288, 358, 860, 273, 303, 330, 435, 666, 29, 319, 902, 935, 982, 95, 254, 439, 785, 1000, 18, 214, 672, 810, 966, 409, 482, 483, 516, 855, 20, 167, 244, 560, 762, 129, 468, 494, 523, 838, 181, 256, 404, 610, 968, 368, 569, 903, 912, 962, 248, 258, 400, 548, 651, 21, 113, 251, 419, 545, 128, 317, 340, 482, 911, 76, 350, 436, 619, 961, 156, 182, 239, 719, 922, 48, 73, 519, 569, 943, 319, 532, 583, 842, 849, 437, 594, 634, 799, 951, 109, 229, 416, 456, 980, 372, 488, 662, 777, 977, 60, 416, 546, 742, 874, 6, 315, 481, 648, 812, 569, 580, 617, 731, 805, 101, 287, 422, 620, 726, 11, 271, 353, 399, 566, 291, 295, 552, 710, 892, 172, 663, 828, 904, 956, 321, 428, 647, 773, 860, 114, 223, 288, 472, 537, 208, 227, 503, 517, 688, 157, 517, 709, 710, 829, 54, 75, 212, 263, 715, 99, 160, 533, 626, 725, 447, 467, 569, 930, 935, 85, 107, 375, 620, 850, 146, 542, 588, 733, 840, 188, 205, 247, 747, 802, 97, 324, 716, 968, 992, 16, 453, 546, 609, 717, 35, 472, 591, 611, 685, 346, 386, 476, 532, 753, 335, 415, 525, 538, 892, 204, 254, 367, 529, 645, 122, 156, 615, 903, 982, 1, 170, 608, 889, 933, 241, 379, 678, 705, 823, 32, 296, 446, 919, 932, 107, 291, 308, 743, 893, 147, 308, 684, 766, 826, 192, 457, 486, 515, 778, 1 } ** 40;
