#import "@preview/touying:0.5.5": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.2.1": *
// #import "@preview/ctheorems:1.1.2": *
#import "@preview/numbly:0.1.0": numbly

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
  duration-minutes: 30,
  start-time: datetime(hour: 14, minute: 10, second: 0),
  end-time: datetime(hour: 14, minute: 40, second: 0),
  last-minutes: 5,
  note-font-size: 12,
  disable-markdown: false,
  default-transition: (
    type: "push",
    duration-seconds: 2,
    angle: ltr,
    alignment: "vertical",
    direction: "inward",
  ),
)

// Theorems configuration by ctheorems
// #show: thmrules.with(qed-symbol: $square$)
// #let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
// #let corollary = thmplain(
//   "corollary",
//   "Corollary",
//   base: "theorem",
//   titlefmt: strong,
// )
// #let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
// #let example = thmplain("example", "Example").with(numbering: none)
// #let proof = thmproof("proof", "Proof")
//
#let mail(email) = {
  text(size: 1.2em)[#raw(email)]
}
#let authors = block[
  #table(
    inset: (0em, 0.5em), stroke: none, columns: (auto, 4fr), align: (left, left),
    [*Nicolas Farabegoli*], [#mail("nicolas.farabegoli@unibo.it")],
    // [Mirko Viroli], [#mail("mirko.viroli@unibo.it")],
    // [Roberto Casadei], [#mail("roby.casadei@unibo.it")],
  )
  #place(right, dy: 2.5em)[
    #figure(image("images/disi.svg", width: 40%))
  ]
]

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config,
    show-bibliography-as-footnote: bibliography(title: none, "bibliography.bib"),
  ),
  config-info(
    title: [Flexible Self-organisation for the Cloud-Edge Continuum],
    subtitle: [_Plenaria PRIN Commonwears 2025 \@ Rome_],
    author: authors,
    date: datetime.today().display("[day] [month repr:long] [year]"),
    institution: [University of Bologna],
    // logo: emoji.school,
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Noto Sans Math")

#set raw(tab-size: 4)
#show raw: set text(size: 0.75em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: (x: 1em, y: 1em),
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: set text(size: 0.75em)

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// == Outline <touying:hidden>

= Background

== Collective Self-organising Applications

A single program $mono("P")$ describes the *collective self-org* behavior of the system, using:
#components.side-by-side(columns: (2fr, auto))[
  - *macroprogramming* abstractions
    - *spatial* and *temporal* operators
  - *proximity-based* interaction (neighbours)
  - resilient *coordination* mechanisms
][
  #align(right)[
    #figure(image("images/scr-result.png", height: 44%))
  ]
]
#quote[Shift from a #underline[device-centric] to a #alert[collective-centric] view of the system.]

== Collective System in the Cloud-edge Continuum

#components.side-by-side(columns: (2fr, auto))[
  ==== Collective program specification
  ```scala
  def channel(source: Boolean, destination: Boolean): Boolean {
    val toSource = gradient(source) // Field[Double]
    val toDestination = gradient(destination) // Field[Double]
    val distance = distanceTo(source, destination)
    (toSource + toDestination - distance) <= 10
  }
  ```
  #components.side-by-side(columns: (1fr, auto))[
    - Functions *composition*
    - _(macro)_program executed by #alert[all the end-devices]
    #v(0.5em)

    // #uncover("2")[
    #box(fill: rgb("EB801A35"), outset: 0.75em, radius: 0.5em)[
      How to _intelligently_ exploit the *#underline[continuum]*?
    ]
    // ]
  ][
    #figure(image("images/channel.svg", height: 40%))
  ]
][
  ==== Edge-Cloud Continuum
  #only("1")[
    #figure(image("images/ac-monolithic-motivation.svg", height: 70%))
  ]
  #only("2")[
    #figure(image("images/edge-cloud-continuum.svg", height: 70%))
  ]
]

= Motivation

== Motivation

*Collective* programs are deployed on #alert[each physical device] of the application.
#components.side-by-side(columns: (2fr, auto), gutter: 1.5em)[
  Two main #underline[limitations]:
  1. *resource-constrained* devices cannot satisfy all the components' requirements
  2. available *infrastructure* is not exploited to its full potential (performance vs cost)

  Previous work #cite(label("FARABEGOLI2024")) tried to partition the _self-org/macroprogramming_ execution model but did not consider the *modularity* at the macro-program level.
][
  #figure(image("images/ac-monolithic-motivation.svg", height: 68%))
]

== Different Service Requirements

#figure((image("images/macro-program-requirements.svg", width: 70%)))
#v(1em)
#align(center)[Each component *may* require multiple requirements to be executed.]


= Macro-components

== Macro-programming Model

#components.side-by-side(columns: (2.5fr, 1fr), gutter: 1.5em)[
  / Macro-program: _direct acyclic graph_ (DAG) of #alert[components] // --- $mono("MP")\(overline(mono("C")), overline(mono("B"))\)$
  / Component: atomic functional macro-program taking a list of #alert[inputs] and producing an #alert[output] // --- $mono("C")$
  / Port: property of each _component_ through which the #alert[values] are received and produced (inputs and output of a function) // --- $mono("p")$
  / Binding: indicates that the #alert[output port] of a component is connected to the #alert[input port] of other components // --- $italic("component")\(mono("p"), mono("C"), overline(mono("p")))$
][
  #figure(image("images/partitioned-macro-program.svg", width: 105%))
]

== Macro-programming Model: Local vs Collective Components

#components.side-by-side(columns: (2fr, auto), gutter: 1.5em)[
  / Local component: just a transformation of #alert[local inputs] to #alert[local outputs].
  / Collective component: requires the interaction with _instances_ of the #alert[same component] in *neighbours*.
][
  #figure(image("images/collective-local-components.svg", height: 55%))
]

== System Model

/ Application devices: devices executing the macro-program $mono("MP")$.
/ Infrastructural devices: devices supporting the execution of some parts of the $mono("MP")$.

#figure(image("images/system-model.svg", width: 55%))

== Application and Deployment Model

#components.side-by-side(columns: (2fr, auto), gutter: 1.5em)[
  // The macro-program $#math.mono("MP")$ is executed  by a $#math.bold("D")$ set of #alert[application devices].

  // Typically the $#math.mono("C")^j_i$ component is executed on the $#math.delta _j$ device (called #alert[owner]).

  // There may be conditions *preventing the execution* of the $#math.mono("C")^j_i$ component on the owner device (e.g., _lack sensor/actuators_, _computational capabilities_, ...).

  Not all the components *can be executed* by the #alert[application device] (e.g., _lack sensor/actuators_, _computational capabilities_, _non-functional requirements_, ...).

  In such cases, the _component_ is offloaded to an *infrastructural device* (#alert[surrogate]).
][
  #figure(image("images/offloading-surrogate.svg", height: 75%))
]

#align(center)[
  The offloading can be *iterative* determining a #alert[forward chain] involving multiple devices.
]

== Execution Model: Asynchronous Round

- Each #underline[component] is #alert[independently executable].
- Its behaviour is organised in #alert[rounds].
- #underline[Outputs] of rounds at each component generate #alert[message] to be shipped.

#figure(image("images/message-propagation.svg", height: 52%))

_Execution model_ *formalised* via #alert[#underline[operational semantics]].
// The #alert[main goals] of this execution model are (#underline[formalised in the paper]):
// - #alert[deployment independent] macro-program specification
// - #alert[self-stabilising] #fcite("DBLP:journals/tomacs/ViroliABDP18") property is preserved w.r.t. the "monolithic" deployment

== Rescue scenario: partitioned macro-program

#figure(image("images/rescue-scenario.svg"))

== Rescue scenario: deployment example

#figure(image("images/rescue-scenario-deployment.svg"))

= Evaluation

== Experimental setup

We setup #underline[three] incremental complex self-organising behaviours:

1. *Gradient*: computation of the distances from a source to all the other devices #cite(label("DBLP:journals/computer/BealPV15"))
2. *SCR*: an implementation of the #alert[_self-organising coordination regions_] #cite(label("DBLP:journals/fgcs/PianiniCVN21")) pattern for splitting the network into sub-regions for handling problems in sub-spaces
3. *Rescue scenario*: a city event scenario where people participate in the event and when an emergency occurs, a rescue team intervenes to help the people

// ==== Objective

Empirically prove #alert[functional equivalence] w.r.t. the *monolithic deployment*, and #alert[non-functional benefits] of the approach.

== Results

#align(center)[
  / Condition: at time $t=900$, the node stop moving

  #v(1em)

  #components.side-by-side(columns: (1fr, 1fr))[

    === Gradient & SCR convergence
    #v(1em)

    - Delay in #alert[convergence] #h(1em) #fa-clock()
    - The #alert[same final result] #h(1.2em) #fa-check-circle()
  ][
    === Rescue scenario
    #v(1em)

    - More #alert[messages] exchanged #h(1em) #fa-exchange-alt()
    - Better #alert[energy consumption] #h(1.2em) #fa-battery-half()
  ]
]
#figure(image("images/power_consumption.svg"))

= Conclusions

== Conclusions and Future Work

We addressed the problem of #underline[multi-component] macro-program #alert[execution] and #alert[deployment] in the *ECC*, improving operational flexibility.

We proved both #underline[formally] and #underline[empirically] that the proposed approach preserves the same #alert[functional] behaviour of the monolithic counterpart, showing #alert[non-functional] benefits.

// *Future work*:

#figure(image("images/future-works.svg"))

#focus-slide("Thank you!")

// #slide[
//   #bibliography("bibliography.bib")
// ]

// - Introduce #alert[capabilities] to constrain the components' execution
// - Support #alert[dynamic] deployments and #alert[reconfiguration] (also with *AI* techniques)
// - Integrates the approach with tools like #alert[kubernetes] to achieve *real deployments*
// - Exploit the *FaaS* paradigm for components offloading and execution

// #slide[
//   #bibliography("bibliography.bib")
// ]

// #new-section-slide("Conclusions")

// #slide(title: "Conclusions and Future Work")[
//   We addressed the problem of #underline[multi-component] macro-program #alert[execution] and #alert[deployment] in the *ECC*, improving operational flexibility.

//   We proved both #underline[formally] and #underline[empirically] that the proposed approach preserves the same #alert[functional] behaviour of the monolithic counterpart, showing #alert[non-functional] benefits.

//   // *Future work*:

//   #figure(image("images/future-works.svg"))

//   // - Introduce #alert[capabilities] to constrain the components' execution
//   // - Support #alert[dynamic] deployments and #alert[reconfiguration] (also with *AI* techniques)
//   // - Integrates the approach with tools like #alert[kubernetes] to achieve *real deployments*
//   // - Exploit the *FaaS* paradigm for components offloading and execution
// ]

// #focus-slide("Thank you!")

// #slide[
//   #bibliography("bibliography.bib")
// ]

// #slide(title: "System model: physical system")[
//   / Physical system: network of #alert[physical devices] $#math.delta #math.in upright(bold("D"))_italic(P)$, exchanging messages according to #alert[physical neighbourhood] relation $cal(N)_P$.

//   #figure(image("images/physical-system.svg", width: 73%))
// ]

// #slide(title: "System model: macro-program and application devices")[
//   / Application logic: it is captured by a #alert[macro-program] $mono("MP")$.
//   / Application devices: subset of the physical devices $upright(bold("D"))$ that execute the $mono("MP")$.

//   #only(1)[#figure(image("images/application-devices.svg", width: 73%))]
//   #only(2)[
//     #figure(image("images/application-devices-neighbourhood.svg", width: 73%))

//     #align(center)[The neighbouring relation of #alert[application devices] is a a #underline[subset] of $cal(N)_P$.]
//   ]
// ]

// #slide(title: "System model: infrastructural devices")[
//   / Infrastructural devices: subset of the _physical devices_ $upright(bold("D"))_I #math.subset.eq upright(bold("D"))_P$ that #alert[can support execution] of some computation on behalf of some _application device_.

//   #only(1)[#figure(image("images/infrastructural-devices.svg", width: 73%))]
//   #only(2)[
//     #figure(image("images/infrastructural-devices-hybrid.svg", width: 73%))

//     #align(center)[A _physical deivce_ can be both an #alert[application device] and an #alert[infrastructural device].]
//   ]
// ]

// #slide(title: "System model: sensors and actuators")[
//   / Sensors and actuators: a device is assumed to have #alert[sensors] and #alert[actuators] to interact with the local environment.

//   #figure(image("images/sensors-actuators.svg", width: 73%))
// ]
