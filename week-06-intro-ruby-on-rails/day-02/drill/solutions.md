# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Solutions

1. <details>
  <summary>In the terminal, type `irb` (you're now in the ruby console!). Type `/hello world/.class`. What does it return?</summary>

  Seriously? No, just do it please.
</details>

2. <details>
    <summary>Write a regexp to match instances of "regex" in the text below. Copy and paste the text (including the HTML tags!) into Rubular as the test string.

  ```html
  <p>A Regular Expression (regex or regexp for short) is a special text string for describing a search pattern.
  You can think of regular expressions as <span>wildcards</span> on steroids. You are probably familiar with wildcard
  notations such as *.txt to find all text files in a file manager. The regex equivalent is <span>\.txt\</span></p>
  <a href="tel:867-5309">Call the RegEx Experts if you get lost.</a>
  <a href="mailto:theregexexperts@example.com">The RegEx Experts</a>
  ```
  </summary>

  `/regexp/`...
</details>

3. <details>
    <summary>With the same test string (text above), write a regexp to match instances of "regex", "regexp", or "regular expression".</summary>
    `/reg(ex[p]?|ular expression)/`
</details>

4. <details>
    <summary>Edit the regexp you just wrote to make sure it's case-insensitive (i.e. it should match "Regular Expression" as well as "regular expression").</summary>

    `/reg(ex[p]?|ular expression)/i`
</details>

5. <details>
      <summary>Match any phone numbers in the HTML like "867-5309".</summary>

      `/\d{3}-\d{4}/`
</details>

6. <details>
    <summary>Match any email addresses in the HTML.</summary>

    `/\w+@[^\.]+\.\w+/`
</details>
