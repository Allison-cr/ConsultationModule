# Consultation Module

 Реализовал коммерческий модуль для клиники. Модуль написан на SwiftUI,логика перехода между экрнами реализована через координатор. Архитектура MVVM. 
 ``` Swift
     func navigateTo(screenType: ScreenType) {
        if let existingScreenIndex = screenStack.firstIndex(where: {
             $0.screenType == screenType }) {
        screenStack.removeLast(screenStack.count - existingScreenIndex - 1)
            displayScreen(screenType)
        } else {
            let newScreen = ScreenInfo(screenType: screenType)
            screenStack.append(newScreen)
            displayScreen(screenType)
        }
    }
```
 ---   
 Есть 3 модели данных, которые приходят с сервера.
 
 __doctors:__
 ```Swift
  "doctors": [
    {
      "doctorId": 1,
      "avatar": "avatar1.jpg",
      "doctorName": "Dr. Smith",
      "specializations": ["Cardiology", "Internal Medicine"],
      "tags": ["Experienced", "Friendly"],
      "isFavorite": true,
      "rating": 4.8,
      "clinicId": 1,
      "title": "Cardiologist"
    }
  ]
```
__consultationsByAmount/consultationsByPeriod:__
 ```Swift
   "consultationsByAmount": [
    {
      "serviceId": 1,
      "code": "code1",
      "clinicId": 1,
      "price": 100,
      "amount": 5,
      "discount": 10
    }
   ]
    "consultationsByPeriod": [
    {
      "serviceId": 11,
      "code": "code11",
      "clinicId": 1,
      "price": 90,
      "periodMonths": 3,
      "discount": 10
    }
 ]
```
__clinics:__
 ```Swift
     "clinics": [
    {
      "clinicId": 0,
      "clinicTitle": "Sunrise Medical Center",
      "cityId": 1,
      "cityName": "New York City"
    }
]
```
---

>1. __Стартовый экран.__  
Дизайн был полностью выполнен из Figma.
На стартовом экране мы можем выбрать тип покупки услуг по количеству/по подписке. Также надо выбрать клинику. Цены в каждой клинике отличаются.  
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.11.50.png" width="230" height="450"> 

---   

>2. __Выбор клиники.__   
Для выбора клиники реализовано два вида поиска: 
> -     Поиск по названию
> -     Поиск по городам  
> Города в списке взяты из модели, которую присылает сервер. 
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.12.02.png" width="230" height="450">
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.12.14.png" width="230" height="450">
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.12.32.png" width="230" height="450">

---   

> __3. После выбора клиники.__  
У каждой клиники свое количество услуг, свои цены, виды подписок. Если выбрать услугу, появятся поля оплат, чека, кнопка продолжения.  
> __Покупка по количеству__  
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.13.51.png" width="230" height="450">  
> __Покупка по подписке__  
<img src="https://raw.githubusercontent.com/Allison-cr/ConsultationModule/main/ConsultationModule/Images/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-29%20at%2023.14.08.png" width="230" height="450">
