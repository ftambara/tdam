#let problem(body) = {
  block(
    fill: luma(245), 
    stroke: (left: 3pt + luma(150)), 
    inset: 1em,
    width: 100%,
    emph(body) 
  )
  v(0.5em)
}

#let assignment(title, author, body) = {
  set document(title: title, author: author)
  set page(paper: "a4", numbering: "1")
  set text(font: "New Computer Modern", size: 11pt) 
  
  align(center)[
    #text(size: 17pt, weight: "bold", title) \
    #v(1em)
    #text(size: 12pt, author)
    #v(2em)
  ]
  
  // This rule automatically styles ALL level 2 headings (==) in your document
  show heading.where(level: 2): it => {
    // Add a separator line above the exercise
    line(length: 100%, stroke: 0.5pt + gray)
    v(0.5em)
    // Print the heading text
    text(size: 12pt, weight: "bold", it.body)
    v(0.5em)
  }
  
  body
}
