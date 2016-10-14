###Guideline “fat models, thin controllers”

[example of fat controller](021_domain_model_events_fat_controller.rb)

####Problems to refactor:

All of activities this action performs are dependent on session-specific
knowledge. Methods like #push_task and #mail_assignment need to know things like who the 
current user is, or what the browser’s asynchronous socket ID is.

**So it's not proper to passing whose info to model.**

but we found out: hindden all these conditionals is a series of domain-model
lifecycle event, each with different concrete action which trigger on thoses
event. like there's some action when tasks/projects' status has been changed.

**What we can do???***

Register listener and adding listener to Controller. Controller would act as a
worker that doing something when something has been changed, but **model** in charge
of the things that has been changed

* **Model**
 * own listener list
 * trigger listener before save
* **Controller** register listener
* **Listener** implement listener method in order to be triggered.

###Supplementary Info

* ActiveRecord: around_save

