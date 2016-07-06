/// UT_test_output(boolean result, string name, string message)
// returns a string formatted correctly to show as a compile message
if (argument0) {
    UT_TEST.UT_succeeded_tests++;
    show_debug_message("   [SUCCES] "+argument1+". "+argument2);
} else {
    show_debug_message("   [FAILURE] "+argument1+". "+argument2);
}
