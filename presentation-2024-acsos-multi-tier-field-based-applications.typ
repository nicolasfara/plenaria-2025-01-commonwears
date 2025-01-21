#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *
#import "@preview/ctheorems:1.1.2": *

#show: thmrules

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: [Optional Footnote]
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#set enum(numbering: "(i)")
#show math.equation: set text(font: "New Computer Modern Math")
#set strong(delta: 200)
#set par(justify: true)
#set list(spacing: 1.9em)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw: set text(size: 0.75em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: (x: 1em, y: 1em),
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let mail(email) = {
  text(size: 1.3em)[#raw(email)]
}

#let authors = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Nicolas Farabegoli*]], [#mail("nicolas.farabegoli@unibo.it")],
    // [Mirko Viroli], [#mail("mirko.viroli@unibo.it")],
    // [Roberto Casadei], [#mail("roby.casadei@unibo.it")],
  )
  #place(right, dy:-1em)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

// #set heading(numbering: "1")
#show: thmrules.with(qed-symbol: " ")
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#EDA7200F"))
#let proof = thmproof("proof", "Proof")

#title-slide(
  title: [
    Flexible Self-organisation for the Cloud-Edge Continuum \
    // a Macro-programming Approach
  ],
  subtitle: [_Plenaria *PRIN Commonwears* 2025 \@ Rome_],
  author: authors,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#new-section-slide("Background")

#slide(title: "Collective Self-organising Applications")[
  A single program $mono("P")$ describes the *collective self-org* behavior of the system, using:
  #side-by-side(columns: (2fr, auto))[
    - *macroprogramming* abstractions
      - *spatial* and *temporal* operators
    - *proximity-based* interaction (neighbours)
    - resilient *coordination* mechanisms
  ][
    #align(right)[
      #figure(image("images/scr-result.png", height: 44%))
    ]
    // #figure(image("images/channel-sim.png", width: 42%))
  ]
  #quote[Shift from a #underline[device-centric] to a #alert[collective-centric] view of the system.]

  #align(center)[#underline[_Aggregate computing_] #fcite("DBLP:journals/computer/BealPV15") as a way to define such applications.]
]

// #slide(title: "Self-org Computational Model")[
//   #alert[Behaviour]: _repeated_ execution with #underline[async rounds] \
//   #alert[Interaction]: _repeated_ *neighbours* #underline[messages exchange] \
//   #alert[Alignment]: each device execution is *aligned* with the others (program _AST_ alignment)

//   #line(length: 100%, stroke: 0.05em + rgb("#23373b"))

//   #only(1)[
//     1. Receiving #alert[messages] from neighbours
//     #figure(image("images/ac-messages-perception.svg", width: 74%))
//   ]
//   #only(2)[
//     2. Computation of the #alert[macro-program] against the received messages
//     #figure(image("images/ac-computation.svg", width: 74%))
//   ]
//   #only(3)[
//     3. Sending to neighbours the #alert[computed messages]
//     #figure(image("images/ac-messages-propagation.svg", width: 74%))
//   ]
//   #only(4)[
//     4. Sleep until next #alert[round]...
//     #figure(image("images/ac.svg", width: 74%))
//   ]
// ]

// Slide sul gradiente

// #slide(title: [Distributed gradient])[
//   #side-by-side(columns: (1fr, 1fr))[
//     ```scala
//     def gradient(source: Boolean): Int = 
//       rep(PositiveInfinity): distance =>
//         mux(source)(0)(1 + minHood(nbr(distance)))
//     ```

//     This function computes the distance from a #alert[source]
//     device to all the other devices in the network.

//     More complex *collective* components are built leveraging the #alert[gradient] function.
//   ][
//     #only(1)[
//       #figure(image("images/gradient-1.svg"))
//     ]
//     #only(2)[
//       #figure(image("images/gradient-1b.svg"))
//     ]
//     #only(3)[
//       #figure(image("images/gradient-2.svg"))
//     ]
//     #only(4)[
//       #figure(image("images/gradient-2b.svg"))
//     ]
//     #only(5)[
//       #figure(image("images/gradient-3.svg"))
//     ]
//     #only(6)[
//       #figure(image("images/gradient-4.svg"))
//     ]
//     #only(7)[
//       #figure(image("images/gradient-4b.svg"))
//     ]
//     #only(8)[
//       #figure(image("images/gradient-5.svg"))
//     ]
//     #only(9)[
//       #figure(image("images/gradient-5b.svg"))
//     ]
//     #only(10)[
//       #figure(image("images/gradient-6.svg"))
//     ]
//   ]
// ]

// #slide(title: [Distributed gradient])[
//   #side-by-side(columns: (1fr, 1fr))[
//     ```scala
//     def gradient(source: Boolean): Int = 
//       rep(PositiveInfinity): distance =>
//         mux(source)(0)(1 + minHood(nbr(distance)))
//     ```

//     This function computes the distance from a #alert[source]
//     device to all the other devices in the network.

//     More complex *collective* components are built leveraging the #alert[gradient] function.
//   ][
//     #only(1)[
//       #figure(image("images/gradient-6b.svg"))
//     ]
//     #only(2)[
//       #figure(image("images/gradient-7.svg"))
//     ]
//     #only(3)[
//       #figure(image("images/gradient-7b.svg"))
//     ]
//     #only(4)[
//       #figure(image("images/gradient-8.svg"))
//     ]
//     #only(5)[
//       #figure(image("images/gradient-8b.svg"))
//     ]
//   ]
// ]

// #slide(title: "Aggregate Programming")[

//   #side-by-side(columns: (2fr, auto))[
//     == Field Composition
//     ```scala
//     def channel(source: Boolean, destination: Boolean): Boolean {
//       val toSource = gradient(source) // Field[Double]
//       val toDestination = gradient(destination) // Field[Double]
//       val distance = distanceTo(source, destination)
//       (toSource + toDestination - distance) <= 10
//     }
//     ```

//     Functions take *fields* as #alert[input] and return *field* as #alert[output].
//   ][
//     #figure(image("images/channel.svg", height: 50%))
//   ]

//   //#v(0.5em)

//   #side-by-side(columns: (auto, auto), gutter: 2em)[
//     _Aggregate Computing_ provide us #alert[formal guarantees] on functional composition: reference for *deployment validation*.
//   ][
//     The entire (_macro_-)program is executed by #alert[all the devices] in the network, \
//     assuming that each device *should* execute #alert[all] the functions.
//   ]
// ]

// #slide(title: "Edge-Cloud Continuum")[
//   #side-by-side(gutter: 2em, columns: (2fr, auto))[
//     #quote[Aggregation of #alert[computational resources] along the data path from the *edge* to the *cloud* #fcite("DBLP:journals/access/MoreschiniPLNHT22")]

//     #v(1em)

//     We must deal with different #alert[capabilities] and #alert[constraints]:
//     - #alert[edge devices]:
//       - used for #underline[sensing/acting] over the (physical) environment
//       - but they are typically *resources-constrained*
//     - #alert[cloud instances]:
//       - offer #underline[scalability] and #underline[computational power]
//       - but introduce *latency/privacy* issues
//   ][
//     #figure(image("images/edge-cloud-continuum.svg", height: 80%))
//   ]

//   // #align(center)[
//   //   The #alert[opportunistic] use of the _continuum_ offers new possibilities, \
//   //   but requires fexible #alert[deployment] strategies.
//   // ]
// ]

#slide(title: "Collective System in the Cloud-edge Continuum")[
  #side-by-side(columns: (2fr, auto), gutter: 2em)[
    ==== Collective program specification
    ```scala
    def channel(source: Boolean, destination: Boolean): Boolean {
      val toSource = gradient(source) // Field[Double]
      val toDestination = gradient(destination) // Field[Double]
      val distance = distanceTo(source, destination)
      (toSource + toDestination - distance) <= 10
    }
    ```
    #side-by-side(columns: (1fr, auto), gutter: 2em)[
      - Functions *composition*
      - _(macro)_program executed by #alert[all the end-devices]

      #only("2")[
        #align(center)[
          How to _intelligently_ exploit the #alert[#underline[continuum]]?
        ]
      ]
    ][
      #figure(image("images/channel.svg", height: 45%))
    ]
  ][
    ==== Edge-Cloud Continuum
    #only("1")[
      #figure(image("images/ac-monolithic-motivation.svg", height: 80%))
    ]
    #only("2")[
      #figure(image("images/edge-cloud-continuum.svg", height: 80%))
    ]
  ]
]

#new-section-slide("Motivation")

#slide(title: "Motivation")[
  *Collective* programs are deployed on #alert[each physical device] of the application.
  #side-by-side(columns: (2fr, auto), gutter: 1.5em)[
    Two main #underline[limitations]:
    1. *resource-constrained* devices cannot satisfy all the components' requirements
    2. available *infrastructure* is not exploited to its full potential (performance vs cost)

    Previous work #fcite("FARABEGOLI2024") tried to partition the _self-org/macroprogramming_ execution model but did not consider the *modularity* at the macro-program level.
  ][
    #figure(image("images/ac-monolithic-motivation.svg", height: 68%))
  ]
]

#slide(title: "Different Service Requirements")[
  #figure((image("images/macro-program-requirements.svg", width: 70%)))
  #v(1em)
  #align(center)[Each component *may* require multiple requirements to be executed.]
]

#new-section-slide("Macro-components") // Qui, se troviamo un nome per l'approccio, lo mettiamo

#slide(title: "Macro-programming Model")[
  #side-by-side(columns: (2.5fr, 1fr), gutter: 1.5em)[
    / Macro-program: _direct acyclic graph_ (DAG) of #alert[components] // --- $mono("MP")\(overline(mono("C")), overline(mono("B"))\)$
    / Component: atomic functional macro-program taking a list of #alert[inputs] and producing an #alert[output] // --- $mono("C")$
    / Port: property of each _component_ through which the #alert[values] are received and produced (inputs and output of a function) // --- $mono("p")$
    / Binding: indicates that the #alert[output port] of a component is connected to the #alert[input port] of other components // --- $italic("component")\(mono("p"), mono("C"), overline(mono("p")))$
  ][
    #figure(image("images/partitioned-macro-program.svg", width: 105%))
  ]
]

#slide(title: "Macro-programming Model: Local vs Collective Components")[
  #side-by-side(columns: (2fr, auto), gutter: 1.5em)[
    / Local component: just a transformation of #alert[local inputs] to #alert[local outputs].
    / Collective component: requires the interaction with _instances_ of the #alert[same component] in *neighbours*.
  ][
    #figure(image("images/collective-local-components.svg", height: 80%))
  ] 
]

#slide(title: "System model")[
  / Application devices: devices executing the macro-program $mono("MP")$.
  / Infrastructural devices: devices supporting the execution of some parts of the $mono("MP")$.

  #figure(image("images/system-model.svg", width: 55%))
]

#slide(title: "Application and deployment model")[
  #side-by-side(columns: (2fr, auto), gutter: 1.5em)[
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
]

#slide(title: "Execution model: asyncronous round")[
    - Each #underline[component] is #alert[independently executable].
    - Its behaviour is organised in #alert[rounds].
    - #underline[Outputs] of rounds at each component generate #alert[message] to be shipped.

    #figure(image("images/message-propagation.svg", height: 52%))

    _Execution model_ *formalised* via #alert[#underline[operational semantics]].
    // The #alert[main goals] of this execution model are (#underline[formalised in the paper]):
    // - #alert[deployment independent] macro-program specification
    // - #alert[self-stabilising] #fcite("DBLP:journals/tomacs/ViroliABDP18") property is preserved w.r.t. the "monolithic" deployment

]

// #slide(title: "Deployment independence of self-stabilising computations")[
//   #only(1)[
//     #theorem(number: "1", [Self-stabilisation #fcite("DBLP:journals/tomacs/ViroliABDP18")])[
//       Given a $mono("MP")$ defining the components $mono(C)_1, #math.dots, mono(C)_n$ and a #underline[correct deployment], then, if:

//       + all components implement #alert[self-stabilising] computation, and
//       + sensor state is #alert[uniform] across all the #underline[forward chains]

//       then the result behaviour observed at the #underline[global output ports] is #alert[self-stabilising], and it is independently from the #alert[deployment] (same result of the *monolithic*).
//     ]
//   ]
//   #only(2)[
//     #proof("(base on operational semantics)")[
//       - No forwarding $#math.arrow$ same as #underline[monolithic] $#math.arrow$ #alert[true] as per#super("4")
//       - If only #underline[1] component $#math.arrow$ #alert[true] by #underline[hypotesis] (self-stabilising components)
//       - If #underline[multiple] components, #alert[true] as per #underline[functional composition]#fcite("DBLP:journals/tomacs/ViroliABDP18") of components
//       - If #underline[forward chain] > 1, and each device fairily #alert[fires], it is guaranteed that the message travels from #underline[source] to #underline[destination] and back $#math.arrow$ #alert[true] since the input messages are eventually the same
//     ]
//   ]
// ]

#slide(title: "Rescue scenario: partitioned macro-program")[
  #figure(image("images/rescue-scenario.svg"))
]

#slide(title: "Rescue scenario: deployment example")[
  #figure(image("images/rescue-scenario-deployment.svg"))
]

#new-section-slide("Evaluation")

// #slide(title: "Evaluation goals")[
//   The evaluation aims at:
//   1. Validating the provided implementation toolchain and the proposed approach to test and #alert[simulate heterogeneous deployments]
//   2. Validating the ability of the system to converge to a stable state #alert[equal] to the one obtained in a monolithic deployment
//   3. Showcase the benefits of the proposal w.r.t. #alert[non-functional aspects] like low energy consumption
// ]

#slide(title: "Experimental setup")[
  We setup #underline[three] incremental complex self-organising behaviours:

  1. *Gradient*: computation of the distances from a source to all the other devices // #fcite("DBLP:journals/computer/BealPV15")
  2. *SCR*: an implementation of the #alert[_self-organising coordination regions_] #fcite("DBLP:journals/fgcs/PianiniCVN21") pattern for splitting the network into sub-regions for handling problems in sub-spaces
  3. *Rescue scenario*: a city event scenario where people participate in the event and when an emergency occurs, a rescue team intervenes to help the people

  // ==== Objective

  Empirically prove #alert[functional equivalence] w.r.t. the *monolithic deployment*, and #alert[non-functional benefits] of the approach.
]

// #slide(title: "Results: gradient convergence")[
//   #figure(image("images/gradient_convergence.svg", width: 80%))
//   #figure(image("images/gradient_convergence_error.svg", width: 80%))
  
//   #align(center)[
//     When $t = 900$ the network stabilises, and the output converges to #alert[the same result].
//   ]
// ]

// #slide(title: "Results: SCR convergence")[
//   #figure(image("images/scr_convergence.svg", width: 80%))
//   #figure(image("images/scr_convergence_error.svg", width: 80%))

//   #align(center)[
//     When $t = 900$ the network stabilises, and the output converges to #alert[the same result].
//   ]
// ]

// #slide(title: "Results: rescue scenario")[
//   #figure(image("images/power_consumption.svg"))

//   #align(center)[
//     The #alert[modularisation] of the macro-program allows to #alert[reduce] the #alert[energy consumption] of the devices, but more messages are exchanged.
//   ]
// ]

#slide(title: "Results")[
  #align(center)[
    / Condition: at time $t=900$, the node stop moving

    #v(1em)

    #side-by-side(columns: (1fr, 1fr))[

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
]

#new-section-slide("Conclusions")

#slide(title: "Conclusions and Future Work")[
  We addressed the problem of #underline[multi-component] macro-program #alert[execution] and #alert[deployment] in the *ECC*, improving operational flexibility.

  We proved both #underline[formally] and #underline[empirically] that the proposed approach preserves the same #alert[functional] behaviour of the monolithic counterpart, showing #alert[non-functional] benefits.

  // *Future work*:

  #figure(image("images/future-works.svg"))

  // - Introduce #alert[capabilities] to constrain the components' execution
  // - Support #alert[dynamic] deployments and #alert[reconfiguration] (also with *AI* techniques)
  // - Integrates the approach with tools like #alert[kubernetes] to achieve *real deployments*
  // - Exploit the *FaaS* paradigm for components offloading and execution
]

#focus-slide("Thank you!")

#slide[
  #bibliography("bibliography.bib")
]

#slide(title: "System model: physical system")[
  / Physical system: network of #alert[physical devices] $#math.delta #math.in upright(bold("D"))_italic(P)$, exchanging messages according to #alert[physical neighbourhood] relation $cal(N)_P$.

  #figure(image("images/physical-system.svg", width: 73%))
]

#slide(title: "System model: macro-program and application devices")[
  / Application logic: it is captured by a #alert[macro-program] $mono("MP")$.
  / Application devices: subset of the physical devices $upright(bold("D"))$ that execute the $mono("MP")$.

  #only(1)[#figure(image("images/application-devices.svg", width: 73%))]
  #only(2)[
    #figure(image("images/application-devices-neighbourhood.svg", width: 73%))

    #align(center)[The neighbouring relation of #alert[application devices] is a a #underline[subset] of $cal(N)_P$.]
  ]
]

#slide(title: "System model: infrastructural devices")[
  / Infrastructural devices: subset of the _physical devices_ $upright(bold("D"))_I #math.subset.eq upright(bold("D"))_P$ that #alert[can support execution] of some computation on behalf of some _application device_.

  #only(1)[#figure(image("images/infrastructural-devices.svg", width: 73%))]
  #only(2)[
    #figure(image("images/infrastructural-devices-hybrid.svg", width: 73%))

    #align(center)[A _physical deivce_ can be both an #alert[application device] and an #alert[infrastructural device].]
  ]
]

#slide(title: "System model: sensors and actuators")[
  / Sensors and actuators: a device is assumed to have #alert[sensors] and #alert[actuators] to interact with the local environment.

  #figure(image("images/sensors-actuators.svg", width: 73%))
]
