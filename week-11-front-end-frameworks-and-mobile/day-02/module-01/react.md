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

> Source: <a href="https://facebook.github.io/react/docs/why-react.html" target="_blank">Why React?</a>

#### React is not...

* **An MVC Framework:** Many people choose to think of React as the "V" in MVC. There are no models or controllers - only UI components that update when your data changes. Traditional MVC frameworks implement two-way data binding, but React uses a [one-way binding]() architecture.

* **A Templating Engine:** Instead of using templates on the server or client to render dynamic data in the view, React builds the UI with reuseable components. This means React uses JavaScript (a real, full featured programming language) to render views, rather than the sometimes limiting syntax of templating languages.

> Source: <a href="https://facebook.github.io/react/blog/2013/06/05/why-react.html" target="_blank">Why did we build React?</a>

#### Summary

>React really shines when your data changes over time.

>In a traditional JavaScript application, you need to look at what data changed and imperatively make changes to the DOM to keep it up-to-date. Even AngularJS, which provides a declarative interface via directives and data binding requires a linking function to manually update DOM nodes.

>React takes a different approach.

>When your component is first initialized, the `render` method is called, generating a lightweight representation of your view. From that representation, a string of markup is produced, and injected into the document. When your data changes, the `render` method is called again. In order to perform updates as efficiently as possible, we diff the return value from the previous call to `render` with the new one, and generate a minimal set of changes to be applied to the DOM."

> Source: <a href="https://facebook.github.io/react/blog/2013/06/05/why-react.html" target="_blank">Why did we build React?</a>

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

Three of the most popular features of React are One-Way Data-Binding, Virtual DOM, and Isomorphic JavaScript. Let's look at the definitions of these terms:

* **One-Way Data-Binding:** React uses a one-way binding architecture, meaning that data passed from a parent element into a child element is owned by the parent. Each component retains a unique state, which is mutable only by the component’s own methods. Source: <a href="http://moduscreate.com/react-native-react-js-goes-mobile" target="_blank">React Native – React.js Goes Mobile</a>.

* **Virtual DOM:** React's Virtual DOM is used for efficiently re-rendering the DOM when data changes. The Virtual DOM is what holds the "diff" of changes since the last update, and it prevents unnecessary re-renders when nothing has changed. Source: <a href="http://stackoverflow.com/questions/21109361/why-is-reacts-concept-of-virtual-dom-said-to-be-more-performant-than-dirty-mode" target="_blank">Why is React's concept of Virtual DOM said to be more performant?</a>

* **Isomorphic JavaScript:** Isomorphic JavaScript is JavaScript that runs both on the client-side and the server-side. Isomorphic JavaScript eliminates some of the problems associated with using front-end frameworks, such as slow page-load when first entering the application and SEO limitations. Source: <a href="http://nerds.airbnb.com/isomorphic-javascript-future-web-apps" target="_blank">Isomorphic JavaScript: The Future of Web Apps</a>.

## Tools

There is an extensive library of tools and technologies used with React, but you can easily get started with just a few of them:

* **React CDNs:** You'll need the <a href="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js" target="_blank">React</a> and <a href="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js" target="_blank">ReactDOM</a> libraries to start building React components for the UI. Note that you can also install the React libraries via `npm` to take advantage of the Isomorphic JavaScript capabilities, but we won't go over this today.

* **JSX:** JSX is a JavaScript syntax extension that looks similar to XML. JSX is not required to use React, but is recommended because of its ease of defining tree structures with attributes. Source: <a href="http://facebook.github.io/react/docs/jsx-in-depth.html" target="_blank">JSX in Depth</a>.

* **Babel:** Babel is a JavaScript compiler used to transform JSX to JavaScript code in development. You'll need to require the <a href="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.6.15/browser.js" target="_blank">Babel CDN</a> in order to use JSX.

## Challenges

1. On the <a href="https://facebook.github.io/react/index.html" target="_blank">React Homepage</a>, scroll down to the "Simple Component" example. You and your partner should walk through the code line-by-line and explain what you think it's doing.

2. The examples are interactive, so in the same "Simple Component" example, create another React component called `Title`. `Title` should return an `<h1></h1>` with the text "My Awesome App". Insert `Title` as a child component to the existing `HelloMessage` component. **Hint:**

  ```js
  var HelloMessage = React.createClass({
    render: function() {
      // add () around returned components
      return (
        // returned components need to be inside a <div></div> tag
        <div>

        </div>
      )
    }
  });
  ```

3. Now edit your `Title` component so that it also includes this tag: `<h2>Today is: {this.props.date}</h2>`. Pass the `date` as an attribute in the parent component (`HelloMessage`). **Hint:** Look at how this is done for `HelloMessage` - its parent is `ReactDOM`.

4. **Bonus:** Instead of using `this.props.date` to pass in the date via an attribute, can you use `this.state.date` to set the date dynamically? **Hint:** Look at the next example, "A Stateful Component" as guidance.

5. When you're doing editing the "Simple Component" example, you and your partner should look at the next two examples, "A Stateful Component" and "An Application" - walk through these examples line-by-line and explain what you think the code does.

## React Tutorial

If you've finished the challenges, head over to the <a href="https://facebook.github.io/react/docs/tutorial.html" target="_blank">React Tutorial</a> and follow the steps to build a comments box. Please use <a href="https://github.com/sf-wdi-24/react-tutorial" target="_blank">this starter code</a> as a base.

Note that the tutorial tells you to write all your JavaScript code in between `<script></script>` tags in the HTML. In our version of the starter code, we've created a blank `public/scripts/app.js` file where you can write your JavaScript code. It's already connected to the view.

Fetch the <a href="https://github.com/sf-wdi-24/react-tutorial/tree/solution" target="_blank">solution branch</a> for a working demo of the comments box.

## Resources

* <a href="https://facebook.github.io/react/docs/getting-started.html" target="_blank">React Docs</a> [React]
* <a href="https://github.com/petehunt/react-howto" target="_blank">react-howto</a> [petehunt]
* <a href="https://www.quora.com/How-is-Facebooks-React-JavaScript-library" target="_blank">How is Facebook's React JavaScript library?</a> [Quora]
* <a href="https://www.quora.com/profile/Pete-Hunt/Posts/React-Under-the-Hood" target="_blank">React: Under the Hood</a> [Quora]
* <a href="http://moduscreate.com/react-native-react-js-goes-mobile" target="_blank">React Native – React.js Goes Mobile</a> [Modus Create]
