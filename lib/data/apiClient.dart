import 'dart:convert';

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<Map<String, dynamic>> fetchData(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    late final MockHttp response;
    if (endpoint == 'labTests') {
      response = MockHttp(statusCode: 200, body: MockData.labTests);
    } else if (endpoint == 'packages') {
      response = MockHttp(statusCode: 200, body: MockData.packages);
    } else {
      response = MockHttp(statusCode: 400, body: '');
    }

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from $endpoint');
    }
  }
}

class MockHttp {
  final int statusCode;
  final String body;

  MockHttp({required this.statusCode, required this.body});
}

class MockData {
  static const labTests = 
  '''
  {
    "data": [
      {
        "id": 0,
        "name": "Thyroid Profile",
        "tests": [
          {
            "id": 213,
            "name": ""
          },
          {
            "id": 545,
            "name": ""
          },
          {
            "id": 55,
            "name": ""
          }
        ],
        "durationInHours": 24,
        "price": 1400,
        "discountedPrice": 1000,
        "hasDiscount": true
      },
      {
        "id": 1,
        "name": "Iron Study Test",
        "tests": [
          {
            "id": 213,
            "name": ""
          },
          {
            "id": 545,
            "name": ""
          },
          {
            "id": 55,
            "name": ""
          }
        ],
        "durationInHours": 24,
        "price": 1000,
        "discountedPrice": 600,
        "hasDiscount": true
      },
      {
        "id": 2,
        "name": "Thyroid Profile",
        "tests": [
          {
            "id": 213,
            "name": ""
          },
          {
            "id": 545,
            "name": ""
          },
          {
            "id": 55,
            "name": ""
          }
        ],
        "durationInHours": 24,
        "price": 1400,
        "discountedPrice": 1000,
        "hasDiscount": true
      },
      {
        "id": 3,
        "name": "Iron Study Test",
        "tests": [
          {
            "id": 213,
            "name": ""
          },
          {
            "id": 545,
            "name": ""
          },
          {
            "id": 55,
            "name": ""
          }
        ],
        "durationInHours": 24,
        "price": 1000,
        "discountedPrice": 600,
        "hasDiscount": true
      }
    ]
  }
  ''';

  static const packages = 
  '''
  {
    "data": [
      {
        "id": 5,
        "name": "Full Body checkup",
        "tests": [
          {
            "id": 23,
            "name": "Blood Glucose Fasting"
          },
          {
            "id": 54,
            "name": "Liver Function Test"
          },
          {
            "id": 55,
            "name": "Liver Function Test"
          },
          {
            "id": 23,
            "name": "Blood Glucose Fasting"
          },
          {
            "id": 54,
            "name": "Liver Function Test"
          },
          {
            "id": 55,
            "name": "Liver Function Test"
          }
        ],
        "durationInHours": 24,
        "price": 2000,
        "hasDiscount": false
      }
    ]
  }
  ''';
}
