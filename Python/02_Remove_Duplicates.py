# ============================================================
# PlatinumRx Assignment | Phase 3 - Python
# File: 02_Remove_Duplicates.py
# Description: Remove duplicate characters from a string
#              using a loop, preserving first-occurrence order.
# Usage: python 02_Remove_Duplicates.py
# ============================================================


def remove_duplicates(input_string):
    """
    Remove duplicate characters from a string using a loop.
    The first occurrence of each character is kept;
    subsequent occurrences are skipped.
    Character order (of first appearances) is preserved.

    Examples:
        "programming"  -> "progamin"
        "hello"        -> "helo"
        "aabbcc"       -> "abc"
        "abcabc"       -> "abc"
        "Python"       -> "Python"  (all unique already)
    """
    result = ""                           # start with an empty string

    for char in input_string:            # loop through every character
        if char not in result:           # only add if NOT already in result
            result += char               # append the new unique character
        # else: character already seen → skip it

    return result


# ─── test cases ───────────────────────────────────────────────
if __name__ == "__main__":
    test_cases = [
        "programming",
        "hello",
        "aabbcc",
        "abcabc",
        "Python",
        "PlatinumRx",
        "mississippi",
        "The quick brown fox",
        "1122334455",
        "",            # edge case: empty string
        "a",           # edge case: single character
    ]

    print("=" * 50)
    print("  Original String         →  Unique String")
    print("=" * 50)
    for s in test_cases:
        unique = remove_duplicates(s)
        print(f"  {repr(s):<25} →  {repr(unique)}")
    print("=" * 50)

    # Interactive mode
    print("\nEnter a string to remove duplicates (or 'q' to quit):")
    while True:
        user_input = input("String: ")
        if user_input.lower() == 'q':
            print("Goodbye!")
            break
        print("Result:", remove_duplicates(user_input))
