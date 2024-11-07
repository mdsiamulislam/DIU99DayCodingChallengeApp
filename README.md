# 99 Days of Coding Challenge - App Development 🚀
**Challenger:** Md Siamul Islam Soaib  
**Sector:** App Development  
**Challenge Organizer:** DIU CPC  
**Challenge Duration:** November 1, 2024 - February 8, 2025  

---

## 📅 Challenge Progress
এই সেকশনে প্রতিদিনের কাজের সংক্ষিপ্ত বিবরণ রাখা হয়েছে। আমি প্রতিদিন যা সিখেছি এখানে তার ওভারভিউ দেওয়া হয়েছে বিস্তারিত প্রোজেক্ট পাবেন আমার ফোল্ডার গুলতে । 

### Day 1: [01 Nov 2024]
**Today's Learning:**  
- আজকের দিনের ফোকাস ছিল অ্যাপ ডেভেলপমেন্ট এর বেসিক টপিক নিয়ে কাজ করা। এবং ইনপুট ফিল্ড নিয়ে কাজ করা । একই সাথে ইন্টারনেট এর সহায়তায় ড্রপডাউন চেষ্টা করেছি 
  
**Project/Code Update:**  
```
DropdownButton<String>(
    value: conversionType,
    tems: <String>[
        "Celsius to Fahrenheit",
        "Fahrenheit to Celsius"
    ].map((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
         );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
          conversionType = newValue!;
            });
        },
    )

``` 
- ইনপুট ফিল্ড এ কি ধরনের ইনপুট হবে সেটি সিলেক্ট করে দেওয়া
- ড্রপডাউন কিভাবে তৈরি করে এবং কাজ করে 

**Screenshot:** 
<img src="assets/1.jpg" alt="Day 1 Work" width="200px">
<img src="assets/2.jpg" alt="Day 1 Work" width="200px">
<img src="assets/3.jpg" alt="Day 1 Work" width="200px">

---

 ### Day 2: [02 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস ছিল UI ডিজাইন এবং Flutter দিয়ে নতুন একটি স্ক্রিন তৈরির উপরে।  আমরা গতকাল ও একটি বিএমআই অ্যাপ করেছিলাম কিন্তু সেখানে ব্যাবহারকারি চাইলে নিজ ইচ্ছা মত ইনপুট দিতে পারতো । আজকে সেটিকে আর উন্নত করা হয়েছে । 

**Project/Code Update:**  
- প্রোজেক্টের জন্য একটি হোম পেজ ডিজাইন করেছি, যেখানে আইকন ,  স্লাইডার এবং টেক্সট যুক্ত করেছি।  

**Screenshot:**  
<img src="assets/4.jpg" alt="Day 2 Work" width="200px">

**Update**
The home page is now fully set up with icons and text, and the BMI app updates are complete!

<img src="assets/5.jpg" alt="Day 2 Work" width="200px">

---

 ### Day 3: [03 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস ছিল আমার আগে থেকেই থাকা আবহাওয়া অ্যাপ টিকে আরো মডিফাই করা যেখানে নতুন ফিচার যুক্ত করা হয়েছে । এখন থেকে লোকেশন বাটনে ক্লিক করলে কারেন্ট লোকেশন অনুযায়ী আবহাওয়া দেখাবে ।

**Project/Code Update:**  
- REST আপি নিয়ে কাজ করেছি , লোকেশন নিয়ে কাজ করেছি , লোকেশন এর মান থেকে শহর খুজে বের করেছি । 

**Screenshot:**  
<img src="assets/6.jpg" alt="Day 3 Work" width="200px">

---

 ### Day 4: [04 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস ছিল একটি টু-ডু অ্যাপ এর ইন্টারফেস তৈরি করে । এবং এটিকে কার্যকর করা । যদিয়ও এর কাজ এখন শেষ হয়নি । ***আমার শিখতে হবে কিভাবে ডিভাইস এ ডেটা সেভ রাখা জায় ।***

**Project/Code Update:**  
- এখানে আমি ডার্ট এর লিস্ট নিয়ে কাজ করেছি , লিস্ট থেকে কিভাবে ডেটা আক্সেস করা জায় এবং ডেটা পরিবর্তন করা জায় ।  

**Screenshot:**  
<img src="assets/7.jpg" alt="Day 4 Work" width="200px">
<img src="assets/8.jpg" alt="Day 4 Work" width="200px">


 ### Day 5: [05 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস ছিল একটি টু-ডু অ্যাপ এর ইন্টারফেস এর বাঘ ভাল্লুক ঠিক করা  ***আমার শিখতে হবে কিভাবে ডিভাইস এ ডেটা সেভ রাখা জায় ।***



**Project/Code Update:**  
- আজকে সিঙ্গেল চাইল স্ক্রল ভিঊ নিয়ে কাজ করেছি , এবং রো অভারফ্ল ঠিক করছি

``` 
আজকের বিশেষ কোন কোড না থাকায় ৪ তারিখের ফাইল এ রাখা হয়েছে 
```

 ### Day 6: [06 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস কিভাবে ডিভাইস এ ডেটা সেভ রাখা জায় ।

**Project/Code Update:**  
- এখানে আমি শেয়ারড প্রেফারেন্স নিয়ে কাজ করেছি । 

**Screenshot:**  
<img src="assets/9.jpg" alt="Day 4 Work" width="200px">

 ### Day 7: [07 Nov 2023]
**Today's Learning:**  
- আজকের দিনের ফোকাস কিভাবে ডিভাইস এ ডেটা সেভ রাখা জায় । এবং সেটি ব্যাবহার করে ইউজার এক্সেরিয়েন্স বৃদ্ধি করা যায় । 

**Project/Code Update:**  
- এখানে আমি শেয়ারড প্রেফারেন্স নিয়ে কাজ করেছি । কিছুটা অথেনটিকেশন এর মতন কাজ করবে 

**Screenshot:**  
<img src="assets/10.jpg" alt="Day 4 Work" width="200px">


<!--
---

## 🏆 Weekly Summary
এই সেকশনে প্রতি সপ্তাহের শেষে আপনার অর্জন এবং শেখার সংক্ষিপ্ত বিবরণ দিন। 

**Week 1 Summary:**  
- এই সপ্তাহে মূলত Flutter এর বেসিক UI তৈরির কৌশল শিখেছি।  
- নতুন একটি স্ক্রিন ডিজাইন করেছি এবং প্রোজেক্টে যুক্ত করেছি।  
- Repo: [GitHub Link to Repo](https://github.com/mdsiamulislam/YourRepoName-99DaysWithCPC)

---

## 📸 Gallery
প্রতি সপ্তাহের সেরা কাজের কিছু স্ক্রিনশট এখানে আপলোড করুন।

---

## 🔗 Useful Links
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)

--- -->

## 💡 Reflections
- **Challenge Observations:** এই চ্যালেঞ্জ আমাকে নিয়মিতভাবে কোড করতে এবং নতুন বিষয় শিখতে অনুপ্রাণিত করছে।
- **Next Week Goals:** আগামী সপ্তাহে আমি Firebase Authentication নিয়ে কাজ করতে চাই।

---

## 🔥 Motivation
এই চ্যালেঞ্জের মাধ্যমে প্রতিদিন কিছু নতুন শিখে নিজের দক্ষতা বৃদ্ধি করার চেষ্টা করছি।

