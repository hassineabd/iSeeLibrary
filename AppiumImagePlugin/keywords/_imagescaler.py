import os
import cv2
from robot.api import logger
from .keywordgroup import KeywordGroup

class _ImageScaler(KeywordGroup):

    @staticmethod
    def scale_image_two_factors(self, path, scale_x: float, scale_y: float, output_path:None):
        """
        Scale the image using two factors (scale_x and scale_y).
        
        Args:
        path (str): The path to the image file.
        scale_x (float): The scaling factor for the x-axis.
        scale_y (float): The scaling factor for the y-axis.
        
        Returns:
        scaled_image (numpy.ndarray): The scaled image.
        """
        image = cv2.imread(path)
        if image is None:
            raise FileNotFoundError(f"The image at path {path} could not be found.")
        
        scaled_image = cv2.resize(image, None, fx=scale_x, fy=scale_y, interpolation=cv2.INTER_LINEAR)
        if not output_path:
            base_name = os.path.basename(path)
            name, ext = os.path.splitext(base_name)
            output_path = f"scaled_{scale_x:.2f}_{scale_y:.2f}_{name}{ext}"
        cv2.imwrite(output_path, scaled_image)
        return output_path
        #logger.info(f"Image saved at {output_path}")
        #self._embed_image_to_log()

    @staticmethod
    def scale_image_single_factor(path, scale: float, output_path:None):
        """
        Scale the image using a single factor.
        
        Args:
        path (str): The path to the image file.
        scale (float): The scaling factor for both axes.
        
        Returns:
        output_path (str): The path to the scaled image file.
        """
        image = cv2.imread(path)
        if image is None:
            raise FileNotFoundError(f"The image at path {path} could not be found.")

        if not output_path:
            base_name = os.path.basename(path)
            name, ext = os.path.splitext(base_name)
            output_path = f"scaled_{scale:.2f}_{name}{ext}"
        scaled_image = cv2.resize(image, None, fx=scale, fy=scale, interpolation=cv2.INTER_LINEAR)
        cv2.imwrite(output_path, scaled_image)
        #logger.info(f"Image saved at {output_path}")
        return output_path

    def _read_file(image_path):
        image = cv2.imread(image_path)
        if image is None:
            raise FileNotFoundError(f"The image at path {image_path} could not be found.")

        if not output_path:
            base_name = os.path.basename(image_path)
            name, ext = os.path.splitext(base_name)
            output_path = f"scaled_{scale:.2f}_{name}{ext}"



    def _generate_output_path(path, scale, output_dir=None):
        base_name = os.path.basename(path)
        name, ext = os.path.splitext(base_name)
        output_base_name = f"scaled_{scale:.2f}_{name}{ext}"
        
        if output_dir is None:
            # Get the directory of the script's location (workspace directory)
            output_dir = os.path.dirname(os.path.abspath(__file__))
        
        output_path = os.path.join(output_dir, output_base_name)
        
        return output_path
