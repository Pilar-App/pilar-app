<p align="center">
  <img src="https://i.postimg.cc/jj2tJdJP/Logo-2-Pilar.png" alt="Pilar - GDSC Solution Challenge 2023"/>
</p>

# Pilar App
![](https://img.shields.io/badge/Flutter-3.7.7-blue) ![](https://img.shields.io/badge/firebase__core-%5E2.8.0-yellow) ![](https://img.shields.io/badge/firebase__auth-%5E4.3.0-yellow) ![](https://img.shields.io/badge/firebase__storage-%5E11.0.16-yellow) ![](https://img.shields.io/badge/cloud__firestore-%5E4.5.0-yellow) ![](https://img.shields.io/badge/get-%5E4.6.5-red)

> University students have difficulties staying organized and productive in their studies, which affects their academic performance, especially their emotional health, generating stress and anxiety.

Jump to

- [SOLUTION IN ACTION](#solution-in-action) 
  - [Visit our past MVP](#visit-our-past-mvp) 
- [TECHNOLOGY STACK](#technology-stack) 
  - Flutter
  - Firebase
  - Google Cloud Platform
  - Dialogflow
  - Google Calendar API
- [PROJECT BRANCHES](#project-branches) 
- [RUN THIS PROJECT](#run-this-project) 
- [DESIGN PATTERN](#design-pattern) 
- [TEAM](#team)


## SOLUTION IN ACTION
We submit our solution for the GDSC Solution challenge 2023 based on the 17 Sustainable Development Goals of the United Nations. You can learn more about the goal [here](https://developers.google.com/community/gdsc-solution-challenge).

Our explanation on [YouTube](https://www.youtube.com/@pilarproductividad).

<a href="https://youtu.be/gnznBZsCex4" target="_blank"><img src="https://img.youtube.com/vi/gnznBZsCex4/0.jpg" 
alt="Pilar - GDSC Solution Challenge 2023"/></a>

[![Pilar-PITCH.jpg](https://i.postimg.cc/MKdQ7BWn/Pilar-PITCH.jpg)](https://postimg.cc/PPvJhPvH)

### Visit our past MVP

[MVP-Pilar-Project/action-mvp](https://github.com/Pilar-App/MVP-Pilar-Project/tree/master/action-mvp)


---

## TECHNOLOGY STACK

[![Flutter](https://img.shields.io/badge/-Flutter-blue?style=for-the-badge&logo=Flutter)](https://flutter.dev/) [![Dart](https://img.shields.io/static/v1?style=for-the-badge&message=Dart&color=0175C2&logo=Dart&logoColor=FFFFFF&label=)](https://dart.dev/)

We use it because it is a powerful and efficient tool for cross-platform mobile app development with attractive design, optimal performance, and support from an active community in Peru. Also, 2 team members had some experience with C++ and Java so Dart was quite familiar to us.


[![Firebase](https://img.shields.io/badge/-Firebase-red?style=for-the-badge&logo=Firebase)](https://firebase.google.com/)

Firebase provides us with a large number of SDKs for different mobile platforms, such as Android, iOS and Flutter. Its integration was quite fast and important as it gave us access to services such as authentication, real-time databases and push notifications in a simple and efficient way.

**`Firestore Database:`**
We use it to store the information of all motivation letters, well-being advice, chronotype questions and references to our users' tasks. (Now we are working on the security of our users' data) 

**`Firebase Auth:`**
We use it to make it easy for our users to log in using their personal Google accounts as a quick alternative.

**`Firebase Cloud Functions:`**
We use it to generate a webhook for Dialogflow in order to manipulate information from Pilar more comfortably and thus add more custom functionality to it.

**`Firebase Storage:`**
We use it to store our images and icons in an organized way without consuming many resources locally

[![Google Cloud](https://img.shields.io/badge/-Google%20Cloud-black?style=for-the-badge&logo=Google-Cloud)](https://cloud.google.com/)

Google Cloud offers a wide range of tools and services that we can use to enhance Pilar's functionality, including the integration with Google Calendar API. We also leverage Google Cloud's machine learning capabilities to improve Pilar's natural language processing and ability to understand user intent. Using Google Cloud allows us to easily scale and expand our infrastructure as needed to meet the growing demand for Pilar's services.

[![imagen.png](https://i.postimg.cc/V6vsdfSn/imagen.png)](https://bot.dialogflow.com/268c02db-0dc8-4fa0-90af-6e56b5733810)

![Dialogflow](https://img.shields.io/badge/-Dialogflow-blueviolet?style=for-the-badge&logo=Dialogflow)
![JavaScript](https://img.shields.io/static/v1?style=for-the-badge&message=JavaScript&color=222222&logo=JavaScript&logoColor=F7DF1E&label=)

We use Dialogflow because it's a leading AI platform for developing chatbots and virtual assistants. It provides advanced natural language processing tools and resources that enable Pilar to better understand queries and respond more accurately and efficiently to users. Additionally, Dialogflow offers an easy-to-use development interface and seamless integration with other platforms and services.

We also use Fulfillment, a feature in Dialogflow that allows Pilar to perform more complex actions and integrations with other systems, such as retrieving data from a database or making API calls.

[![Google Calendar](https://img.shields.io/static/v1?style=for-the-badge&message=Google+Calendar&color=4285F4&logo=Google+Calendar&logoColor=FFFFFF&label=)](https://developers.google.com/calendar/api/guides/)
![JavaScript](https://img.shields.io/static/v1?style=for-the-badge&message=JavaScript&color=222222&logo=JavaScript&logoColor=F7DF1E&label=)

Moreover, we integrate Pilar with Google Calendar API, which allows users to schedule appointments and reminders directly from the conversation with Pilar. This integration streamlines the process of managing schedules and tasks for users and enhances the overall user experience.
[![imagen.png](https://i.postimg.cc/7LCZmPV9/imagen.png)](https://postimg.cc/Ff4vK4wk)


---

## PROJECT BRANCHES

| Branch | Description |
| ------ | ------ |
| PROD | Final branch to run in production |
| PRE | Branch to test the latest changes |
| PILAR-001 | Here we initialize the project |
| PILAR-002 | We add the Sign In button and configure Firebase |
| PILAR-003 | We added the first project documentation |
| PILAR-004 | We create the Home and the Navbar view |
| PILAR-005 | We added the Splash view |
| PILAR-006 | We create the view of the chatbot |
| PILAR-008 | We connect the project with Dialogflow |
| PILAR-012 | We create the task creation view |
| PILAR-013 | We carry out the entire flow of the form to identify the chronotype |
| PILAR-014 | We create the user profile view |

---

## RUN THIS PROJECT
**Bellow steps are required** to run fully Pilar application.

- Clone project to local machine:

  ```git clone https://github.com/Pilar-App/pilar-app.git```

- Open your terminal and run:

  ```flutter pub get```

- Connect real device (Android phone)
  
  Follow this for connect your real device [Android](https://developer.android.com/studio/run/device)
  
  We tested on: Xiaomi Redmi 9T (Android 11)

- Finally run command and enjoy 🎉:

  ```flutter run```

- More document run project with [Flutter](https://docs.flutter.dev/)

## DESIGN PATTERN

[![](https://res.cloudinary.com/joseniquen/image/upload/v1680322853/pilar/Captura_de_pantalla_2023-03-31_231942_lywcqr.png)](https://res.cloudinary.com/joseniquen/image/upload/v1680322853/pilar/Captura_de_pantalla_2023-03-31_231942_lywcqr.png)

The design pattern we use is the most common when using Getx as a state handler. This pattern is ideal for our project because we use many widgets and views that control states in common.

## TEAM:

We are a Peruvian team, made up of students from multidisciplinary careers such as Systems Engineering, Business Engineering and Electronic Engineering. We are a diverse team passionate about innovation!

Our team has a wide range of skills and knowledge, which complement each other perfectly to tackle challenges and projects like Pilar. We decided to start this project because energy management is a problem that also happens to us and by surveying our university we realized that we are not the only ones. We believe in the impact that developing an application of this style will have since we have a clear why.

[![Ednaly.jpg](https://i.postimg.cc/Zq02b6qp/Ednaly.jpg)](https://postimg.cc/zLZ0pbKG)

<a href="https://github.com/Pilar-App/MVP-Pilar-Project/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Pilar-App/MVP-Pilar-Project" />
</a>
<a href="https://github.com/Ednaly/web-starting/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Ednaly/web-starting" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
