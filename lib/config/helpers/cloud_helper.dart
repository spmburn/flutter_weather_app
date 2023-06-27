class CloudHelper {
  static String getCloudName(int cloud) {
  if (cloud >= 0 && cloud <= 25) {
    return "Clear Sky";
  } else if (cloud > 25 && cloud <= 50) {
    return "Partly Cloudy";
  } else if (cloud > 50 && cloud <= 75) {
    return "Cloudy";
  } else if (cloud > 75 && cloud <= 100) {
    return "Overcast";
  } else {
    return "Invalid percentage";
  }
}

}