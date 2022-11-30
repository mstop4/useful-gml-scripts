randomise();
test_array = [1, -3, "foo", { n: "bar" }, [0, 2.333]];
choice = choose_from_array(test_array);
found = array_find(test_array, "foo");