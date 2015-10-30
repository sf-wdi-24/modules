## HTML Strings

### Good:
```
function buildGithubLink(student) {
  var full_name = student.first_name + " " + student.last_name;
  var url = "http://github.com/" + student.github_username;
  return "<a href='" + url + "'>" + full_name + "</a>";
}

function renderGithubLinks(students){
  students.forEach(function(student){
    var link = buildGithubLink(student);
    $("body").append( link + "</br>" );
  });
}

renderGithubLinks( data.students );
Better optimized:

function renderGithubLinks(students){
  var anchors = students.map(buildGithubLink);
  var html = anchors.join("</br>");
  $("body").append( html );
}

renderGithubLinks( data.students );
```
