class ImageUtil {
  static String getImagePath(String name, {String format = "png"}) {
    return "images/$name.$format";
  }
}
