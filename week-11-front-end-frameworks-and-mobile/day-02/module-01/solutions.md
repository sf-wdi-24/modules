# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro React - Solutions

## React Challenges

1. On the <a href="https://facebook.github.io/react/index.html" target="">React Homepage</a>, scroll down to the "Simple Component" example. You and your partner should walk through the code line-by-line and explain what you think it's doing.

  ```js
  // Creates a new React component called HelloMessage.
  var HelloMessage = React.createClass({
    render: function() {
      // Component renders a <div> with a dynamic name attribute
      // that will be passed in from the parent component.
      return <div>Hello {this.props.name}</div>;
    }
  });

  // The ReactDOM component renders HelloMessage, passing in "John"
  // as the name attribute. The ReactDOM will be inserted into
  // the page inside an HTML element called mountNode.
  ReactDOM.render(<HelloMessage name="John" />, mountNode);
  ```

2. The examples are interactive, so in the same "Simple Component" example, create another React component called `Title`. `Title` should return an `<h1></h1>` with the text "My Awesome App". Insert `Title` as a child component to the existing `HelloMessage` component.

  ```js
  var HelloMessage = React.createClass({
    render: function() {
      return (
        <div>
        	<Title />
        	<div>Hello {this.props.name}</div>
        </div>
      )
    }
  });

  var Title = React.createClass({
    render: function() {
      return <h1>My Awesome App</h1>
    }
  });

  ReactDOM.render(<HelloMessage name="John" />, mountNode);
  ```

3. Now edit your `Title` component so that it also includes this tag: `<h2>Today is: {this.props.date}</h2>`. Pass the `date` as an attribute in the parent component (`HelloMessage`).

  ```js
  var HelloMessage = React.createClass({
    render: function() {
      return (
        <div>
        	<Title date="Jan 26" />
        	<div>Hello {this.props.name}</div>
        </div>
      )
    }
  });

  var Title = React.createClass({
    render: function() {
      return (
        <div>
        	<h1>My Awesome App</h1>
        	<h2>Today is: {this.props.date}</h2>
        </div>
      )
    }
  });

  ReactDOM.render(<HelloMessage name="John" />, mountNode);
  ```

4. **Bonus:** Instead of using `this.props.date` to pass in the date via an attribute, can you use `this.state.date` to set the date dynamically?

  ```js
  var HelloMessage = React.createClass({
    render: function() {
      return (
        <div>
        	<Title />
        	<div>Hello {this.props.name}</div>
        </div>
      )
    }
  });

  var Title = React.createClass({
    getInitialState: function() {
      return {date: new Date().toJSON().slice(0,10)};
    },
    render: function() {
      return (
        <div>
        	<h1>My Awesome App</h1>
        	<h2>Today is: {this.state.date}</h2>
        </div>
      )
    }
  });

  ReactDOM.render(<HelloMessage name="John" />, mountNode);
  ```

5. When you're doing editing the "Simple Component" example, you and your partner should look at the next two examples, "A Stateful Component" and "An Application" - walk through these examples line-by-line and explain what you think the code does.

  **A Stateful Component:**

  ```js
  // Creates a new React component called HelloMessage.
  var Timer = React.createClass({
    // Sets initial secondsElapsed state to 0.
    getInitialState: function() {
      return {secondsElapsed: 0};
    },
    // Defines function that runs when component mounts (called below).
    // Increases secondsElapsed state by 1.
    tick: function() {
      this.setState({secondsElapsed: this.state.secondsElapsed + 1});
    },
    // Defines function that runs when component "mounts" to DOM.
    // Tick function runs every second to increase secondsElapsed.
    componentDidMount: function() {
      this.interval = setInterval(this.tick, 1000);
    },
    // Defines function that runs when component "unmounts" from the DOM.
    // Clear interval.
    componentWillUnmount: function() {
      clearInterval(this.interval);
    },
    // Component renders a <div> with dynamic secondsElapsed state.
    render: function() {
      return (
        <div>Seconds Elapsed: {this.state.secondsElapsed}</div>
      );
    }
  });

  // The ReactDOM component renders the Timer component.
  ReactDOM.render(<Timer />, mountNode);
  ```

  **An Application:**

  ```js
  // Creates a new React component called TodoList.
  var TodoList = React.createClass({
    render: function() {
      // Defines function that renders each todo item inside an <li></li>.
      var createItem = function(item) {
        return <li key={item.id}>{item.text}</li>;
      };
      // Maps items property to createItem function
      // to generate <li></li>'s for each item.
      // (items property will be passed in as an
      // attribute from the parent component.)
      return <ul>{this.props.items.map(createItem)}</ul>;
    }
  });

  // Creates a new React component called TodoApp.
  var TodoApp = React.createClass({
    // Sets initial state with empty items array and blank text.
    getInitialState: function() {
      return {items: [], text: ''};
    },
    // Defines function that runs when value of input field changes.
    // and updates state's text to value from input field.
    onChange: function(e) {
      this.setState({text: e.target.value});
    },
    // Defines a function that runs when form submits
    // and updates state's items to include the new item.
    handleSubmit: function(e) {
      e.preventDefault();
      var nextItems = this.state.items.concat([{text: this.state.text, id: Date.now()}]);
      var nextText = '';
      this.setState({items: nextItems, text: nextText});
    },
    // Renders all todo list items and a form to create
    // new todos. onSubmit and onChange listen for the form
    // submitting and the value of the input field changing.
    render: function() {
      return (
        <div>
          <h3>TODO</h3>
          <TodoList items={this.state.items} />
          <form onSubmit={this.handleSubmit}>
            <input onChange={this.onChange} value={this.state.text} />
            <button>{'Add #' + (this.state.items.length + 1)}</button>
          </form>
        </div>
      );
    }
  });

  // The ReactDOM component renders the TodoApp component.
  ReactDOM.render(<TodoApp />, mountNode);
  ```
