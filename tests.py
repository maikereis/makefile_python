from script import sum_func, sub_func


def test_sum():
    assert sum_func(2, 2) == 4
    assert sum_func(2, 1) == 3
    assert sum_func(-1, -1) == -2


def test_sub():
    assert sub_func(2, 2) == 0
    assert sub_func(2, 1) == 1
    assert sub_func(-1, -1) == 0
