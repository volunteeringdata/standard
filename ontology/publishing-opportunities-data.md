---
permalink: /ontology/publishing-opportunities-data
layout: default
title: Publishing Opportunities Data
breadcrumbs:
  - title: "Ontology"
    url: /ontology/
  - title: "Publishing Opportunities Data"
---


<h2 id="multiple-organisations">Sharing multiple organisations opportunities</h2>

<p>Volunteering opportunities can be shared as a list of organisations, each containing their activities with full details. This is the recommended structure for publishing opportunity data using the standard.</p>

<p>The top-level document is a JSON-LD array of <a href="/ontology/#organisation">Organisation</a> objects. Each organisation embeds its <a href="/ontology/#activity">activities</a>, which in turn embed their <a href="/ontology/#role">roles</a> and <a href="/ontology/#session">sessions</a> (with <a href="/ontology/#location">location</a> and <a href="/ontology/#time">time</a> details).</p>

<div class="example">
  <h5 id="example-1">Example 1</h5>
  <pre class="hljs json">{
  <span class="hljs-attr">"@context"</span>: <span class="hljs-string">"https://api.volunteeringdata.io/context/v1"</span>,
  <span class="hljs-attr">"graph"</span>: [
    {
      <span class="hljs-attr">"type"</span>: <span class="hljs-string">"Organisation"</span>,
      <span class="hljs-attr">"id"</span>: <span class="hljs-string">"https://id.volunteeringdata.io/684059665d271835a2253c9d"</span>,
      <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Under One Sky"</span>,
      <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Under One Sky supports people experiencing homelessness through outreach, community meals, and practical assistance."</span>,
      <span class="hljs-attr">"website"</span>: <span class="hljs-string">"https://underoneskytogether.com/"</span>,
      <span class="hljs-attr">"cause"</span>: [
          <span class="hljs-string">"https://ns.volunteeringdata.io/AntiPoverty"</span>
      ],
      <span class="hljs-attr">"activity"</span>: [
          {
          <span class="hljs-attr">"id"</span>: <span class="hljs-string">"https://id.volunteeringdata.io/686e542f7734eb69b0ec1516"</span>,
          <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Volunteer Skywalker"</span>,
          <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Help distribute food, drink, and much-needed essential supplies to those who don't have a safe place to call home."</span>,
          <span class="hljs-attr">"role"</span>: [
              {
              <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Outreach Volunteer"</span>,
              <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Walk set routes to engage with people sleeping rough, offering food, warm clothing, and signposting to support services."</span>,
              <span class="hljs-attr">"commitment"</span>: <span class="hljs-string">"One evening per week, 3-hour shift"</span>,
              <span class="hljs-attr">"applyLink"</span>: <span class="hljs-string">"https://underoneskytogether.com/get-involved/join-us"</span>,
              <span class="hljs-attr">"allowsRemoteParticipation"</span>: <span class="hljs-literal">false</span>,
              <span class="hljs-attr">"minimumAge"</span>: <span class="hljs-string">"18"</span>,
              <span class="hljs-attr">"requirement"</span>: [
                  <span class="hljs-string">"https://ns.volunteeringdata.io/DBSCheck"</span>
              ],
              <span class="hljs-attr">"reward"</span>: [
                  <span class="hljs-string">"https://ns.volunteeringdata.io/TrainingProvided"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/ExpensesReimbursed"</span>
              ],
              <span class="hljs-attr">"skill"</span>: [
                  <span class="hljs-string">"https://ns.volunteeringdata.io/Communication"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/EmpathyAndCompassion"</span>
              ]
              }
          ],
          <span class="hljs-attr">"session"</span>: [
              {
              <span class="hljs-attr">"location"</span>: {
                  <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Under One Sky Hub"</span>,
                  <span class="hljs-attr">"address"</span>: <span class="hljs-string">"127-128 Lower Marsh, London SE1 7AE, UK"</span>,
                  <span class="hljs-attr">"latitude"</span>: <span class="hljs-string">"51.5005014"</span>,
                  <span class="hljs-attr">"longitude"</span>: <span class="hljs-string">"-0.1136474"</span>
              },
              <span class="hljs-attr">"time"</span>: [
                  <span class="hljs-string">"https://ns.volunteeringdata.io/MondayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/TuesdayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayAfternoon"</span>
                ]
              }
            ]
          }
        ]
      },
      {
        <span class="hljs-attr">"type"</span>: <span class="hljs-string">"Organisation"</span>,
        <span class="hljs-attr">"id"</span>: <span class="hljs-string">"https://id.volunteeringdata.io/64103c352a0eedb6aef42d3d"</span>,
        <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Oxfam GB"</span>,
        <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Oxfam is a global movement of people working together to end the injustice of poverty."</span>,
        <span class="hljs-attr">"website"</span>: <span class="hljs-string">"https://www.oxfam.org.uk/"</span>,
        <span class="hljs-attr">"charityNumber"</span>: <span class="hljs-string">"202918"</span>,
        <span class="hljs-attr">"image"</span>: <span class="hljs-string">"https://example.org/images/oxfam-logo.png"</span>,
        <span class="hljs-attr">"cause"</span>: [
            <span class="hljs-string">"https://ns.volunteeringdata.io/AntiPoverty"</span>,
            <span class="hljs-string">"https://ns.volunteeringdata.io/CivilRights"</span>
        ],
        <span class="hljs-attr">"activity"</span>: [
          {
            <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Shop Volunteer"</span>,
            <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Help sort donations, serve customers, and keep the shop looking great. No experience needed."</span>,
            <span class="hljs-attr">"role"</span>: [
                {
                <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Shop Floor Volunteer"</span>,
                <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Sort and price donated items, assist customers, and help maintain the shop floor."</span>,
                <span class="hljs-attr">"commitment"</span>: <span class="hljs-string">"Half a day per week"</span>,
                <span class="hljs-attr">"applyLink"</span>: <span class="hljs-string">"https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/"</span>,
                <span class="hljs-attr">"allowsRemoteParticipation"</span>: <span class="hljs-literal">false</span>,
                <span class="hljs-attr">"minimumAge"</span>: <span class="hljs-string">"14"</span>,
                <span class="hljs-attr">"reward"</span>: [
                    <span class="hljs-string">"https://ns.volunteeringdata.io/TrainingProvided"</span>
                ],
                <span class="hljs-attr">"skill"</span>: [
                    <span class="hljs-string">"https://ns.volunteeringdata.io/CustomerService"</span>,
                    <span class="hljs-string">"https://ns.volunteeringdata.io/Teamwork"</span>
                ]
              }
            ],
            <span class="hljs-attr">"session"</span>: [
              {
              <span class="hljs-attr">"location"</span>: {
                  <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Oxfam Shop Headingley"</span>,
                  <span class="hljs-attr">"address"</span>: <span class="hljs-string">"3 North Lane, Headingley, Leeds LS6 3HG, UK"</span>,
                  <span class="hljs-attr">"latitude"</span>: <span class="hljs-string">"53.8218"</span>,
                  <span class="hljs-attr">"longitude"</span>: <span class="hljs-string">"-1.5811"</span>
              },
              <span class="hljs-attr">"time"</span>: [
                  <span class="hljs-string">"https://ns.volunteeringdata.io/MondayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/MondayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/TuesdayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/TuesdayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/ThursdayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/ThursdayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/FridayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/FridayAfternoon"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayMorning"</span>,
                  <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayAfternoon"</span>
              ]
            }
          ]
        }
      ]
    }
  ]
}</pre>
</div>

<div class="note">
  <h5 id="note-1">Note 1</h5>
  <p>The <code>graph</code> property (mapped to <a href="https://www.w3.org/TR/json-ld11/#named-graphs">@graph</a> in JSON-LD) is used to group multiple top-level objects under a single shared <code>@context</code>. This avoids repeating the context in every organisation object. Each item in the <code>graph</code> array is an independent node in the linked data graph.</p>
</div>


<h2 id="multiple-organisations">Sharing one organisations' opportunities</h2>

<p>A single organisation can publish its own opportunities as one object with multiple activities.</p>

<div class="example">
  <h5 id="example-2">Example 2</h5>
  <pre class="hljs json">{
  <span class="hljs-attr">"@context"</span>: <span class="hljs-string">"https://api.volunteeringdata.io/context/v1"</span>,
  <span class="hljs-attr">"type"</span>: <span class="hljs-string">"Organisation"</span>,
  <span class="hljs-attr">"id"</span>: <span class="hljs-string">"https://id.volunteeringdata.io/64103c352a0eedb6aef42d3d"</span>,
  <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Oxfam GB"</span>,
  <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Oxfam is a global movement of people working together to end the injustice of poverty."</span>,
  <span class="hljs-attr">"website"</span>: <span class="hljs-string">"https://www.oxfam.org.uk/"</span>,
  <span class="hljs-attr">"charityNumber"</span>: <span class="hljs-string">"202918"</span>,
  <span class="hljs-attr">"cause"</span>: [
      <span class="hljs-string">"https://ns.volunteeringdata.io/AntiPoverty"</span>,
      <span class="hljs-string">"https://ns.volunteeringdata.io/CivilRights"</span>
  ],
  <span class="hljs-attr">"activity"</span>: [
      {
      <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Shop Volunteer"</span>,
      <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Help sort donations, serve customers, and keep the shop looking great. No experience needed."</span>,
      <span class="hljs-attr">"role"</span>: [
          {
          <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Shop Floor Volunteer"</span>,
          <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Sort and price donated items, assist customers, and help maintain the shop floor."</span>,
          <span class="hljs-attr">"commitment"</span>: <span class="hljs-string">"Half a day per week"</span>,
          <span class="hljs-attr">"applyLink"</span>: <span class="hljs-string">"https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/"</span>,
          <span class="hljs-attr">"allowsRemoteParticipation"</span>: <span class="hljs-literal">false</span>,
          <span class="hljs-attr">"minimumAge"</span>: <span class="hljs-string">"14"</span>,
          <span class="hljs-attr">"reward"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/TrainingProvided"</span>
          ],
          <span class="hljs-attr">"skill"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/CustomerService"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/Teamwork"</span>
          ]
          }
      ],
      <span class="hljs-attr">"session"</span>: [
          {
          <span class="hljs-attr">"location"</span>: {
              <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Oxfam Shop Headingley"</span>,
              <span class="hljs-attr">"address"</span>: <span class="hljs-string">"3 North Lane, Headingley, Leeds LS6 3HG, UK"</span>,
              <span class="hljs-attr">"latitude"</span>: <span class="hljs-string">"53.8218"</span>,
              <span class="hljs-attr">"longitude"</span>: <span class="hljs-string">"-1.5811"</span>
          },
          <span class="hljs-attr">"time"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/MondayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/MondayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/TuesdayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/TuesdayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/ThursdayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/ThursdayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/FridayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/FridayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/SaturdayAfternoon"</span>
          ]
          }
      ]
      },
      {
      <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Online Shop Volunteer"</span>,
      <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Help list and sell donated items online. Photograph items, write descriptions, and manage listings from home or in-store."</span>,
      <span class="hljs-attr">"role"</span>: [
          {
          <span class="hljs-attr">"title"</span>: <span class="hljs-string">"Online Listings Volunteer"</span>,
          <span class="hljs-attr">"description"</span>: <span class="hljs-string">"Photograph donated items, write compelling descriptions, and list them for sale on Oxfam's online shop."</span>,
          <span class="hljs-attr">"commitment"</span>: <span class="hljs-string">"Half a day per week"</span>,
          <span class="hljs-attr">"applyLink"</span>: <span class="hljs-string">"https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/"</span>,
          <span class="hljs-attr">"allowsRemoteParticipation"</span>: <span class="hljs-literal">true</span>,
          <span class="hljs-attr">"minimumAge"</span>: <span class="hljs-string">"16"</span>,
          <span class="hljs-attr">"reward"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/TrainingProvided"</span>
          ],
          <span class="hljs-attr">"skill"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/Photography"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/Writing"</span>
          ]
          }
      ],
      <span class="hljs-attr">"session"</span>: [
          {
          <span class="hljs-attr">"location"</span>: {
              <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Oxfam Shop Headingley"</span>,
              <span class="hljs-attr">"address"</span>: <span class="hljs-string">"3 North Lane, Headingley, Leeds LS6 3HG, UK"</span>,
              <span class="hljs-attr">"latitude"</span>: <span class="hljs-string">"53.8218"</span>,
              <span class="hljs-attr">"longitude"</span>: <span class="hljs-string">"-1.5811"</span>
          },
          <span class="hljs-attr">"time"</span>: [
              <span class="hljs-string">"https://ns.volunteeringdata.io/MondayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/MondayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/WednesdayAfternoon"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/FridayMorning"</span>,
              <span class="hljs-string">"https://ns.volunteeringdata.io/FridayAfternoon"</span>
          ]
          }
      ]
      }
  ]
}</pre>
</div>


<h2 id="metadata-publishing">Sharing opportunities with metadata</h2>

<p>Volunteering opportunities can be shared with additional information about the data itself: license, publisher and so on.</p>

<div class="example">
  <h5 id="example-3">Example 3</h5>
  <pre class="hljs json">{
  <span class="hljs-attr">"@context"</span>: <span class="hljs-string">"https://api.volunteeringdata.io/context/v1"</span>,
  <span class="hljs-attr">"conformsTo"</span>: <span class="hljs-string">"https://ns.volunteeringdata.io/"</span>,
  <span class="hljs-attr">"license"</span>: <span class="hljs-string">"CC-BY-NC-SA-4.0"</span>,
  <span class="hljs-attr">"publisher"</span>: <span class="hljs-string">"https://scvo.scot/"</span>,
  <span class="hljs-attr">"modified"</span>: <span class="hljs-string">"2026-03-23"</span>,
  <span class="hljs-attr">"graph"</span>: [
    {
      <span class="hljs-attr">"type"</span>: <span class="hljs-string">"Organisation"</span>,
      <span class="hljs-attr">"id"</span>: <span class="hljs-string">"https://id.volunteeringdata.io/684059665d271835a2253c9d"</span>,
      <span class="hljs-attr">"name"</span>: <span class="hljs-string">"Under One Sky"</span>,
      ...
    }
  ]
}</pre>
</div>

<div class="note">
  <h5>Note</h5>
  <p>The <code>license</code> property value <code>"CC-BY-NC-SA-4.0"</code> is an <a href="https://spdx.org/licenses/">SPDX license identifier</a>. SPDX (System Package Data Exchange) provides a standardised list of license identifiers that can be used to communicate licensing information in a concise and unambiguous way.</p>
</div>