import os
from lambda_packages import lambda_packages
from nose.tools import assert_true

def test_packages():
    for name, details in lambda_packages.items():
        assert_true(os.path.exists(details['path']))
        assert_true(os.path.exists(details['python2.7-path']))

        if 'python3.6' in details:
            assert_true(os.path.exists(details['python3.6-path']))