import test_class

my_test = {
    "_target_": "TBLogger",
    "a":"2"
}

getattr(test_class,my_test["_target_"])(my_test["a"])