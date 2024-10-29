clear,clc,close all
%{
    By: Asad Mirza, PhD
    For: BME Department
    Purpose: MATLAB code to calculate Major-Specific GPA for FIU's 
    Undergraduate BME program with predefined BME courses
%}
% Define the grading scale using containers.Map
gradeScale = containers.Map({'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'D', 'F'}, ...
                            [4.0, 3.7, 3.3, 3.0, 2.7, 2.3, 2.0, 1.0, 0]);

% Predefined BME courses with grades and credits (adjust grades as needed)
% Format: {'Grade', Credits}
courses = {
    'A', 2;  % BME 1008C - Introduction to BME
    'A', 1; % BME 1054L - BME Computing Lab
    'A', 3; % BME 2740 - BME Modeling & Simulation
    'B', 3;  % BME 3721 - BME Data Evaluation Principles
    'B+', 3; % BME 3403 - Engineering Analysis of Bio Systems I
    'B', 3;  % BME 3404 - Engineering Analysis of Bio Systems II
    'A', 1;  % BME 4011 - Clinical Rotations for BME
    'A-', 3; % BME 4100 - Biomaterials
    'A', 3;  % BME 4503C - Medical Instrumentation Design
    'B+', 1; % BME 4050L - BME Lab I
    'A', 1;  % BME 4051L - BME Lab II
    'A-', 3; % BME 4800C - Design of BME Systems and Devices
    'B+', 3; % BME 4908 - Senior Design Project
    'B', 3;  % BME 3632 - BME Transport
    'A', 0;  % BME 4930 - Undergraduate Seminar (0 credits, pass/fail, included for reference)
    % Electives and other BME-specific courses can be added here as needed
};

% Initialize variables
totalGradePoints = 0;
totalCredits = 0;

% Loop through each course to calculate total grade points and credits
for i = 1:size(courses, 1)
    grade = courses{i, 1};  % Grade as a letter (e.g., 'A', 'B+')
    credits = courses{i, 2}; % Credit hours for the course
    
    % Check if the grade exists in the grade scale map
    if gradeScale.isKey(grade) && credits > 0 % Exclude courses with 0 credits
        % Get the grade points for the grade
        gradePoints = gradeScale(grade);
        
        % Calculate total grade points for this course
        totalGradePoints = totalGradePoints + gradePoints * credits;
        
        % Add the course credits to the total credits
        totalCredits = totalCredits + credits;
    elseif credits == 0
        fprintf('Course %d is pass/fail with no credits.\n', i);
    else
        fprintf('Invalid grade "%s" for course %d\n', grade, i);
    end
end

% Calculate Major-Specific GPA
if totalCredits > 0
    majorGPA = totalGradePoints / totalCredits;
    fprintf('Your Major-Specific GPA is: %.2f\n', majorGPA);
else
    fprintf('No valid credits entered, unable to calculate GPA.\n');
end
