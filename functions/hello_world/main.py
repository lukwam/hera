# -*- coding: utf-8 -*-
"""Hello World Cloud Function."""
# from hera import hello


def hello_world(request):
    """Hello World function."""
    # message = hello()
    message = "Hello World!"
    print(message)
    return message


if __name__ == "__main__":
    hello_world(None)
