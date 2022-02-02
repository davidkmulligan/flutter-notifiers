import 'dart:math';

/// Returns a hyphenated 8-digit String id in the format '0000-0000'
String generateHexId() {
  final _random = Random();
  String _id = '';

  for (int i = 0; i < 8; i++) {
    if (i == 3) {
      _id += '-';
      continue;
    }

    final _nextDigit = _random.nextInt(16);
    _id += _hexDigits[_nextDigit];
  }

  return _id;
}

const List<String> _hexDigits = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'a',
  'b',
  'c',
  'd',
  'e',
  'f'
];
