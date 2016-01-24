# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> React

| Objectives |
| :--- |
| Define React and explain its use cases. |
| Compare and contrast React to other front-end frameworks, like AngularJS. |
| Use React to build a simple "Hello World" application. |

## Introduction

React is a JavaScript library created and maintained by Facebook for building user interfaces. Facebook built React to solve one problem: **building large applications with data that changes over time**.

#### React is...

* **Simple:** You define how your app should look at any given point in time, and React will automatically manage all UI updates when your underlying data changes.

* **Declarative:** When your data changes, React conceptually hits the "refresh" button and knows to only update the changed parts (+1 for performance).

* **Reuseable:** React is all about building reusable components. Since the components are so encapsulated, they make code reuse, testing, and separation of concerns easy.

> Source: <a href="https://facebook.github.io/react/docs/why-react.html" target="">Why React?</a>

#### React is not...

* **An MVC Framework:** Many people choose to think of React as the "V" in MVC. There are no models or controllers - only UI components that update when your data changes. Traditional MVC frameworks implement two-way data binding, but React uses a [one-way binding]() architecture.

* **A Templating Engine:** Instead of using templates on the server or client to render dynamic data in the view, React builds the UI with reuseable components. This means React uses JavaScript (a real, full featured programming language) to render views, rather than the sometimes limiting syntax of templating languages.

> Source: <a href="https://facebook.github.io/react/blog/2013/06/05/why-react.html" target="">Why did we build React?</a>

#### Summary

>React really shines when your data changes over time.

>In a traditional JavaScript application, you need to look at what data changed and imperatively make changes to the DOM to keep it up-to-date. Even AngularJS, which provides a declarative interface via directives and data binding requires a linking function to manually update DOM nodes.

>React takes a different approach.

>When your component is first initialized, the `render` method is called, generating a lightweight representation of your view. From that representation, a string of markup is produced, and injected into the document. When your data changes, the `render` method is called again. In order to perform updates as efficiently as possible, we diff the return value from the previous call to `render` with the new one, and generate a minimal set of changes to be applied to the DOM."

> Source: <a href="https://facebook.github.io/react/blog/2013/06/05/why-react.html" target="">Why did we build React?</a>

## Angular vs. React

Angular and React are both JavaScript libraries used to create dynamic, data-rich user interfaces, but the two frameworks take very different approaches. Let's look at some of the similarities and differences:

| | Angular | React |
| :--- | :--- | :--- |
| **Back-End Agnostic?** | YES | YES |
| **Works well with other front-end frameworks?** | Not Really | YES |
| **Listens to Events?** (submits, clicks, etc.) | YES | YES |
| **MVC?** | YES | NO |
| **Templating?** | YES | NO |
| **Data-Binding?** | Two-Way | One-Way |
| **Virtual DOM?** | NO | YES |
| **Isomorphic?** | NO | YES |

## Terms

* **One-Way Data-Binding**
* **Virtual DOM**
* **Isomorphic JavaScript**

## Tools

* React SDK
* npm
* JSX
* Babel

## Resources

* <a href="https://facebook.github.io/react/docs/getting-started.html">React Docs</a>
* <a href="https://github.com/petehunt/react-howto" target="">react-howto</a>
