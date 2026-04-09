# ============================================================
# PlatinumRx Assignment | Phase 3 - Python
# File: 01_Time_Converter.py
# Description: Convert integer minutes into human-readable
#              "X hrs Y minutes" format.
# Usage: python 01_Time_Converter.py
# ============================================================


def convert_minutes(total_minutes):
    """
    Convert total minutes (int) to a human-readable string.

    Examples:
        130  -> "2 hrs 10 minutes"
        110  -> "1 hr 50 minutes"
        60   -> "1 hr 0 minutes"
        45   -> "0 hrs 45 minutes"
        0    -> "0 hrs 0 minutes"
    """
    if not isinstance(total_minutes, (int, float)) or total_minutes < 0:
        return "Invalid input: please provide a non-negative number."

    total_minutes = int(total_minutes)           # ensure integer arithmetic
    hours           = total_minutes // 60        # integer division → hours
    remaining_mins  = total_minutes  % 60        # modulo        → leftover minutes

    # Singular / plural for "hr" vs "hrs"
    hr_label  = "hr"  if hours          == 1 else "hrs"
    min_label = "minute" if remaining_mins == 1 else "minutes"

    return f"{hours} {hr_label} {remaining_mins} {min_label}"


# ─── test cases ───────────────────────────────────────────────
if __name__ == "__main__":
    test_cases = [130, 110, 60, 45, 0, 1, 61, 120, 300, 999]

    print("=" * 40)
    print("  Minutes  →  Human-Readable Time")
    print("=" * 40)
    for mins in test_cases:
        result = convert_minutes(mins)
        print(f"  {mins:>6}   →  {result}")
    print("=" * 40)

    # Interactive mode
    print("\nEnter a number of minutes to convert (or 'q' to quit):")
    while True:
        user_input = input("Minutes: ").strip()
        if user_input.lower() == 'q':
            print("Goodbye!")
            break
        try:
            print("Result:", convert_minutes(int(user_input)))
        except ValueError:
            print("Please enter a valid integer.")
