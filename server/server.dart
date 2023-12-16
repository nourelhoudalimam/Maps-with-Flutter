// server.dart
import 'dart:convert';
import 'dart:io';

void main() async {
  HttpServer server = await HttpServer.bind('192.168.1.26', 3000);
  print('Listening on ${server.address}:${server.port}');

  await for (HttpRequest request in server) {
    handleRequest(request);
  }
}

void handleRequest(HttpRequest request) async {
  try {
    if (request.method == 'POST') {
      String content = await utf8.decoder.bind(request).join();
      Map<String, dynamic> carMovement = jsonDecode(content);

      // Save the car movement data to a database or file
      saveCarMovement(carMovement);

      request.response
        ..statusCode = HttpStatus.ok
        ..write('Car movement data received successfully.');
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request method');
    }
  } catch (e) {
    request.response
      ..statusCode = HttpStatus.internalServerError
      ..write('Internal Server Error: $e');
  } finally {
    await request.response.close();
  }
}

void saveCarMovement(Map<String, dynamic> carMovement) {
  try {
    // Convert the car movement data to a JSON string
    String jsonData = jsonEncode(carMovement);

    // Specify the file path where you want to save the data
    String filePath = 'car_movements.json';

    // Open the file (or create it if it doesn't exist) in write mode
    File file = File(filePath);
    IOSink sink = file.openWrite(mode: FileMode.write);

    // Write the JSON data to the file
    sink.write(jsonData);

    // Close the file
    sink.close();

    print('Car movement data saved to $filePath');
  } catch (e) {
    print('Error saving car movement data: $e');
  }
}
