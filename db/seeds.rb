def candidate_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/candidate_photos/#{file_name}.jpg"))
end

def candidate_marksheet(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/marksheet/#{file_name}.jpg"))
end

User.create([{name:"Molay kumar", email:"molay@gmail.com", password:"molay123", password_confirmation: "molay123", admin: true},
             { name:"Deepak kumar", email:"deepak@gmail.com", password:"deepak", password_confirmation: "deepak"},
             { name:"Abhijeet kumar", email:"abhijeet@gmail.com", password:"abhijeet", password_confirmation: "abhijeet"},
             { name:"Ankita kashyap", email:"ankita@gmail.com", password:"ankita123", password_confirmation: "ankita123"},
             { name:"Arnab saha", email:"arnab@gmail.com", password:"arnab123", password_confirmation: "arnab123"},
             { name:"Akash viswash", email:"akash@gmail.com", password:"akash123", password_confirmation: "akash123"},
             { name:"Nandan kumar", email:"nandan@gmail.com", password:"nandan123", password_confirmation: "nandan123"},
             { name:"Raman raghav", email:"raman@gmail.com", password:"ramanraghav", password_confirmation: "ramanraghav"},
             { name:"Davinder singh virdi", email:"davinder@gmail.com", password:"davinder", password_confirmation: "davinder"}])

Section.create([{section_name:'Kindergarten Section', section_grades: 'Kindergarten'},
                {section_name:'Junior Section', section_grades: '1st,2nd,3rd,4th'},
                {section_name:"Boy's Section", section_grades: '5th,6th,7th,8th,9th,10th,11th,12th'},
                {section_name:"Girl's Section", section_grades: '5th,6th,7th,8th,9th,10th,11th,12th'}])

Candidate.create!([{name:"Deepak kumar", father_name:"Pappu kumar", mother_name:"Banishava Devi",
                    image: candidate_image('deepak'), contact_address: "Peevees Mirage, Nilambur P.O., Malappuram District, Kerala. 679329",
                    education: "Not Applicable", parent_contact_number: 9865252558,
                    alternate_parent_contact_number: 8695326586, user_id: 2, section_id: 1},

                    {name:"Abhijeet kumar", father_name:"Gunjan kumar", mother_name:"Preeti Devi",
                    image: candidate_image('abhijeet'), contact_address: "Mazhuvannoor House, P.O. Melampara, Bharananganam, Kottayam Dt., Kerala. 686578",
                    education: "1st", marksheet: candidate_marksheet('abhijeet'), parent_contact_number: 9874523318,
                    alternate_parent_contact_number: 8652369856, user_id: 3, section_id: 2},

                    {name:"Ankita Kashyap", father_name:"Raghu kumar kashyap", mother_name:"Divya Kashyap",
                    image: candidate_image('ankita'), contact_address: "At-Chanchala Niwas, Ward No-16, PO-Bargarh, Dist.-Bargarh, Odisha",
                    education: "9th", marksheet: candidate_marksheet('ankita'),
                    parent_contact_number: 8456321458, alternate_parent_contact_number: 8698695362,
                    user_id: 4, section_id: 4},

                    {name:"Arnab saha", father_name:"Raghu saha", mother_name:"Disha saha",
                    image: candidate_image('arnab'), contact_address: "C/O Thermax Limited, Thermax House, 14, Mumbai-Pune Road, WAKDEWADI, Pune, Maharashtra. 411003",
                    education: "10th", marksheet: candidate_marksheet('arnab'), parent_contact_number: 9953421458,
                    alternate_parent_contact_number: 8998623362, user_id: 5, section_id: 3}])

Notice.create(notice_title:"Admission Notice for Kindergarten section for the Year 2018-2019", content:"Approximately
              225 candidates will be selected for admission to Kindergarten. Application Forms can be downloaded
              from the school web site . The Application Forms will be available during September. Exact dates of
              availability will be notified through a notice on the school website. Receiving the Application Form
              or going through the admission procedure does not guarantee admission.")

Eligibility.create(title:"Admission to Class X", criteria:"As the syllabus prescribed at Secondary level is of
                  two years integrated course, no admission shall be taken in Class X directly. Provided further
                  that admission to Class X in a school shall be open only to such a student who:(a) has completed
                  a regular course of study for class IX, and (b) has passed class IX examination from an
                  institution affiliated to this Board.(c) A student who has completed a regular course of study
                  for Class IX and has passed Class IX examination from an institution recognised by/affiliated
                  to any recognised Board in India, other than this Board, can be admitted to a school only on the
                  transfer of the parent(s) or shifting of their families from one place to another, after procuring
                  from the students the mark sheet and the Transfer Certificate duly countersigned by the Educational
                  Authorities of the Board concerned. In case of such admissions the schools would obtain post facto
                  approval of the Board within one month of admission of the student.")
