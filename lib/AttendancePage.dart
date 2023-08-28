import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/blue-back.jpg'),
            Positioned(
              top: 40,
              left: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),

            Positioned(
              top: 50,
              left: 75,
              child: Text(
                  "Nouman   Ahmed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            ),

            Positioned(
              top: 50,
              right: 20,
              child: Icon(Icons.notifications, color: Colors.white,),
            ),

            Positioned(
              top: 120,
              left: 20,
              child: Row(
                children: [
                  Text(
                      "THE  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 40,
                      color: Colors.white
                    ),
                  ),

                  Text(
                      "TUITIONIST",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),

            // Attendance ONWARD Portion

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 220),
                Text(
                  "Attendance",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),

                SubjectDropdown("Islamic Study"),
                SubjectDropdown("Physics"),
                SubjectDropdown("English I"),
              ],
            ),
          ],
        ),
    );
  }
}

class SubjectDropdown extends StatefulWidget {
  final String subjectName;

  SubjectDropdown(this.subjectName);

  @override
  _SubjectDropdownState createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  String? _selectedValue;
  bool _isDropdownVisible = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }

  void _selectValue(String? value) {
    setState(() {
      _selectedValue = value;
      _isDropdownVisible = false; // Close the dropdown after selecting a value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40), // Add padding here
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: _toggleDropdown,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.subjectName,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          _isDropdownVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isDropdownVisible)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                        border: InputBorder.none,
                      ),
                      value: _selectedValue,
                      onChanged: _selectValue,
                      items: <String>['Present', 'Absent', 'Leave']
                          .map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

