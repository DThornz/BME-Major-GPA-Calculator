# Python code to calculate Major-Specific GPA for FIU BME program with predefined BME courses

# Define the grading scale
grade_scale = {
    'A': 4.0, 'A-': 3.7, 'B+': 3.3, 'B': 3.0,
    'B-': 2.7, 'C+': 2.3, 'C': 2.0, 'D': 1.0, 'F': 0
}

# Predefined BME courses with grades and credits (adjust grades as needed)
# Format: [(Grade, Credits)]
courses = [
    ('A', 2),   # BME 1008C - Introduction to BME
    ('A', 1),   # BME 1054L - BME Computing Lab
    ('A', 3),   # BME 2740 - BME Modeling & Simulation
    ('B', 3),   # BME 3721 - BME Data Evaluation Principles
    ('B+', 3),  # BME 3403 - Engineering Analysis of Bio Systems I
    ('B', 3),   # BME 3404 - Engineering Analysis of Bio Systems II
    ('A', 1),   # BME 4011 - Clinical Rotations for BME
    ('A-', 3),  # BME 4100 - Biomaterials
    ('A', 3),   # BME 4503C - Medical Instrumentation Design
    ('B+', 1),  # BME 4050L - BME Lab I
    ('A', 1),   # BME 4051L - BME Lab II
    ('A-', 3),  # BME 4800C - Design of BME Systems and Devices
    ('B+', 3),  # BME 4908 - Senior Design Project
    ('B', 3),   # BME 3632 - BME Transport
    ('A', 0)    # BME 4930 - Undergraduate Seminar (0 credits, pass/fail)
]

# Initialize variables
total_grade_points = 0
total_credits = 0

# Loop through each course to calculate total grade points and credits
for grade, credits in courses:
    # Check if the grade exists in the grade scale and credits are more than 0
    if grade in grade_scale and credits > 0:
        # Calculate total grade points for this course
        grade_points = grade_scale[grade]
        total_grade_points += grade_points * credits
        total_credits += credits
    elif credits == 0:
        print(f'Course with grade "{grade}" is pass/fail with no credits.')
    else:
        print(f'Invalid grade "{grade}" for course.')

# Calculate Major-Specific GPA
if total_credits > 0:
    major_gpa = total_grade_points / total_credits
    print(f'Your Major-Specific GPA is: {major_gpa:.2f}')
else:
    "No valid credits entered, unable to calculate GPA."