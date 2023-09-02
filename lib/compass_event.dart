class CompassEvent {
  // The heading, in degrees, of the device around its Z
  // axis, or where the top of the device is pointing.
  final double? heading;

  // The heading, in degrees, of the device around its X axis, or
  // where the back of the device is pointing.
  final double? headingForCameraMode;

  // The deviation error, in degrees, plus or minus from the heading.
  // NOTE: for iOS this is computed by the platform and is reliable. For
  // Android several values are hard-coded, and the true error could be more
  // or less than the value here.
  final double? accuracy;

  CompassEvent({
    this.heading,
    this.headingForCameraMode,
    this.accuracy,
  });

  factory CompassEvent.fromList(List<double>? data) => CompassEvent(
        heading: data?[0],
        headingForCameraMode: data?[1],
        accuracy: (data == null) || (data[2] == -1) ? null : data[2],
      );

  @override
  String toString() =>
      'CompassEvent(heading: $heading, headingForCameraMode: $headingForCameraMode, accuracy: $accuracy)';
}
