import importlib.util
import os
import unittest
from pathlib import Path
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('env_loader', Path(__file__).parent / 'src/Appium/Helpers/env_loader.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class EnvironmentTests(unittest.TestCase):
    def test_required_value(self):
        with patch.dict(os.environ, {'QA_REQUIRED_VALUE': ' configured '}, clear=True):
            self.assertEqual(module.get_env_variable('QA_REQUIRED_VALUE'), ' configured ')

    def test_missing_and_blank_values(self):
        for values in ({}, {'QA_REQUIRED_VALUE': ''}, {'QA_REQUIRED_VALUE': '   '}):
            with self.subTest(values=values), patch.dict(os.environ, values, clear=True):
                with self.assertRaisesRegex(ValueError, 'QA_REQUIRED_VALUE'):
                    module.get_env_variable('QA_REQUIRED_VALUE')


if __name__ == '__main__':
    unittest.main()
