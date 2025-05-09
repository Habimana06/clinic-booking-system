-- Create Departments Table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Doctors Table
CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Create Patients Table
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Appointments Table
CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    status VARCHAR(50) DEFAULT 'Scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Create Payments Table
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE,
    payment_method VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);

-- Insert Data into Departments
INSERT INTO departments (name, description) VALUES 
('Cardiology', 'Heart-related treatments'),
('Pediatrics', 'Healthcare for children'),
('Orthopedics', 'Bone and joint care');

-- Insert Data into Doctors
INSERT INTO doctors (name, specialization, department_id, phone, email) VALUES 
('Dr. Alice Mukamana', 'Cardiologist', 1, '0788888888', 'alice@clinic.com'),
('Dr. John Niyonzima', 'Pediatrician', 2, '0788777777', 'john@clinic.com'),
('Dr. Grace Uwase', 'Orthopedic Surgeon', 3, '0788666666', 'grace@clinic.com');

-- Insert Data into Patients
INSERT INTO patients (name, date_of_birth, gender, phone, email) VALUES 
('Emmanuel Habimana', '1990-05-12', 'Male', '0728000001', 'emmanuel@example.com'),
('Aline Uwineza', '1985-11-23', 'Female', '0728000002', 'aline@example.com'),
('Eric Tuyishime', '2000-03-15', 'Male', '0728000003', 'eric@example.com');

-- Insert Data into Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status) VALUES 
(1, 1, '2025-05-10', '09:00:00', 'Regular heart checkup', 'Scheduled'),
(2, 2, '2025-05-11', '10:30:00', 'Child fever', 'Scheduled'),
(3, 3, '2025-05-12', '11:00:00', 'Knee pain', 'Scheduled');

-- Insert Data into Payments
INSERT INTO payments (appointment_id, amount, payment_method) VALUES 
(1, 25000.00, 'Mobile Money'),
(2, 20000.00, 'Cash'),
(3, 30000.00, 'Equity Bank');
