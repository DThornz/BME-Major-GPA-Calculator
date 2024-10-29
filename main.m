clear,clc,close all
%{
    By: Asad Mirza, PhD
    For: BME Department
    Purpose: MATLAB code to calculate Major-Specific GPA for FIU's 
    Undergraduate BME program with predefined BME courses
%}
% Define the grading scale using containers.Map
gradeScale = containers.Map({'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'D', 'F'}, ...
    [4.0, 3.67, 3.33, 3.0, 2.67, 2.33, 2.00, 1.00, 0]);
% Predefined BME courses with grades and credits (adjust grades as needed)
% Format: {'Grade', Credits}
courses = {
    'A', 2;  % BME 1008C - Introduction to BME
    'B+', 1; % BME 1054L - BME Computing Lab
    'A-', 3; % BME 2740 - BME Modeling & Simulation
    'B', 3;  % BME 3721 - BME Data Evaluation Principles
    'C+', 3; % BME 3403 - Engineering Analysis of Bio Systems I
    'B', 3;  % BME 3404 - Engineering Analysis of Bio Systems II
    'A', 1;  % BME 4011 - Clinical Rotations for BME
    'B-', 3; % BME 4100 - Biomaterials
    'A', 3;  % BME 4503C - Medical Instrumentation Design
    'B+', 1; % BME 4050L - BME Lab I
    'A', 1;  % BME 4051L - BME Lab II
    'A-', 3; % BME 4800C - Design of BME Systems and Devices
    'B+', 3; % BME 4908 - Senior Design Project
    % Add more BME courses as needed
    };
% Initialize variables
totalGradePoints = 0;
totalCredits = 0;
% Loop through each course to calculate total grade points and credits
for ii = 1:size(courses, 1)
    grade = courses{ii, 1};  % Grade as a letter (e.g., 'A', 'B+')
    credits = courses{ii, 2}; % Credit hours for the course
    % Check if the grade exists in the grade scale map
    if gradeScale.isKey(grade)
        % Get the grade points for the grade
        gradePoints = gradeScale(grade);
        % Calculate total grade points for this course
        totalGradePoints = totalGradePoints + gradePoints * credits;

        % Add the course credits to the total credits
        totalCredits = totalCredits + credits;
    else
        fprintf('Invalid grade "%s" for course %d\n', grade, ii);
    end
end
% Calculate Major-Specific GPA
if totalCredits > 0
    majorGPA = totalGradePoints / totalCredits;
    fprintf('Your Major-Specific GPA is: %.2f\n', majorGPA);
else
    fprintf('No valid credits entered, unable to calculate GPA.\n');
end