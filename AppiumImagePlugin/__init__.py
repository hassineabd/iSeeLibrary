import os 
from AppiumImagePlugin.keywords import *
from AppiumImagePlugin.version import VERSION

__version__ = VERSION


class AppiumImagePlugin(
    _LoggingKeywords,
    _ScreenshotKeywords,
    _ImageKeywords,
    _ImageScaler
):

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION


    def __init__(self):

        for base in AppiumImagePlugin.__bases__:
            base.__init__(self)