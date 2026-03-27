import os
import site
import sys


def _add_user_site_packages():
    user_site = site.getusersitepackages()
    if user_site and os.path.isdir(user_site) and user_site not in sys.path:
        sys.path.append(user_site)


_add_user_site_packages()
