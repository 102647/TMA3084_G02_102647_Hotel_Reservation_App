import 'package:flutter/material.dart';
import 'room_list_page.dart';
import 'validators.dart';

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({super.key});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  DateTime? _checkIn;
  int _guests = 2;
  String _room = 'Double Room';
  bool _breakfast = false;
  bool _accepted = false;

  String? _dateError;
  String? _policyError;

  static const Color green = Color(0xFF789477);
  static const Color darkGreen = Color(0xFF344638);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final today = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (selectedDate != null) {
      setState(() {
        _checkIn = selectedDate;
        _dateError = null;
      });
    }
  }

  void _submitBooking() {
    final formValid = _formKey.currentState!.validate();
    final dateError = validateCheckIn(_checkIn);
    final policyError = validateAgreement(_accepted);

    setState(() {
      _dateError = dateError;
      _policyError = policyError;
    });

    if (!formValid || dateError != null || policyError != null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomListPage(
          guests: _guests,
          checkIn: _checkIn,
          preferredRoom: _room,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Green Haven Hotel',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Book Your Stay',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Relax, unwind and enjoy your stay with us.',
                style: TextStyle(color: darkGreen),
              ),

              const SizedBox(height: 24),

              const Text(
                'Guest Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                key: const Key('guestNameField'),
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Guest name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: validateName,
              ),
              const SizedBox(height: 16),

              TextFormField(
                key: const Key('emailField'),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: validateEmail,
              ),
              const SizedBox(height: 16),

              TextFormField(
                key: const Key('phoneField'),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                validator: validatePhone,
              ),

              const SizedBox(height: 24),

              const Text(
                'Check-in Date',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 12),

              
OutlinedButton.icon(
  key: const Key('checkInButton'),
  onPressed: _selectDate,
  icon: const Icon(Icons.calendar_month),
  label: AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: Text(
      _checkIn == null
          ? 'Choose check-in date'
          : '${_checkIn!.day}/${_checkIn!.month}/${_checkIn!.year}',
      key: ValueKey(_checkIn),
    ),
  ),
),


              if (_dateError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    _dateError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              const Text(
                'Number of Guests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),

              Text('Guests: $_guests'),

              Slider(
                key: const Key('guestSlider'),
                value: _guests.toDouble(),
                min: 1,
                max: 5,
                divisions: 4,
                activeColor: green,
                label: '$_guests',
                onChanged: (value) {
                  setState(() {
                    _guests = value.round();
                  });
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Room Preference',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                key: const Key('roomDropdown'),
                initialValue: _room,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.bed_outlined),
                  labelText: 'Select room',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Single Room',
                    child: Text('Single Room'),
                  ),
                  DropdownMenuItem(
                    value: 'Double Room',
                    child: Text('Double Room'),
                  ),
                  DropdownMenuItem(
                    value: 'Family Room',
                    child: Text('Family Room'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _room = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              SwitchListTile(
                key: const Key('breakfastSwitch'),
                title: const Text('Include breakfast'),
                value: _breakfast,
                activeThumbColor: green,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    _breakfast = value;
                  });
                },
              ),

              CheckboxListTile(
                key: const Key('policyCheckbox'),
                title: const Text('I accept the hotel policy'),
                value: _accepted,
                activeColor: green,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    _accepted = value ?? false;
                    _policyError = null;
                  });
                },
              ),

              if (_policyError != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    _policyError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  padding: EdgeInsets.symmetric(
    vertical: _accepted ? 5 : 0,
  ),
  child: ElevatedButton(
                  key: const Key('reserveButton'),
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
