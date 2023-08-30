symptom(fever, infection).
symptom(cough, infection).
symptom(sore_throat, infection).
symptom(headache, infection).
symptom(rash, allergy).
symptom(sneezing, allergy).
symptom(watery_eyes, allergy).
symptom(chest_pain, heart_disease).
symptom(shortness_of_breath, heart_disease).
symptom(fatigue, heart_disease).
symptom(dizziness, heart_disease).
symptom(abdominal_pain, appendicitis).
symptom(nausea, appendicitis).
symptom(vomiting, appendicitis).
symptom(loss_of_appetite, appendicitis).

diagnose(Infection) :-
    has_symptoms(infection, Infection).

diagnose(Allergy) :-
    has_symptoms(allergy, Allergy).

diagnose(HeartDisease) :-
    has_symptoms(heart_disease, HeartDisease).

diagnose(Appendicitis) :-
    has_symptoms(appendicitis, Appendicitis).

has_symptoms(Illness, Illness) :-
    symptom(Symptom, Illness),
    write('Do you have '), write(Symptom), write('? (yes/no): '),
    read(Response),
    Response = yes.

% Entry point
start_diagnosis :-
    write('Welcome to the hospital diagnostic system!'), nl,
    write('Please answer the following questions with "yes" or "no".'), nl,
    write('Are you experiencing any symptoms? (yes/no): '),
    read(SymptomResponse),
    (SymptomResponse = yes -> diagnosis_menu; write('Please consult a doctor for accurate diagnosis.'), nl).

diagnosis_menu :-
    write('Which symptom are you experiencing? (Type the symptom and press Enter): '), nl,
    read(Symptom),
    (symptom(Symptom, _) -> diagnose(Symptom); write('Invalid symptom. Please enter a valid symptom.'), nl).
