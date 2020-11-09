---
weight: 1
title: "µSpecs"
bookCollapseSection: true
---

# µSpecs

µSpecs or muSpecs are the short notation format of furo FIDL. If you are just interested in protobuf as output, you can 
get very far with this format. If you need **enums** you have add them in the standard spec, but are still able to work 
with the µSpec for the rest.

Our main goal is to keep the µSpecs as small/simple as possible.



```proto
syntax = "proto3";

message SearchRequest {
  string query = 1;
  int32 page_number = 2;
  int32 result_per_page = 3;
}
```

```javascript
import { LitElement, html, property, customElement } from 'lit-element';

@customElement('simple-greeting')
export class SimpleGreeting extends LitElement {
  @property() name = 'World';

  render() {
    return html`<p>Hello, ${this.name}!</p>`;
  }
}
```