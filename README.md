# <img src="/Samijz/Assets.xcassets/AppIcon.appiconset/samijz-logo-1024.png"  width="64" height="64"> Samijz 
A vibrant, mobile-first iOS app built for a fictional vegan grilled sandwich shop. *Samijz* lets users search the menu, customize their sandwiches with delicious vegan fillings, and see real-time updates on calorie count and cost — all before placing an order. It’s clean, functional, and extendable.

## Features
- Browse and search the full vegan sandwich menu
- Customize ingredients for each menu item
- Real-time updates of calories and cost as you build your sandwich
- Add custom items to your order and track totals instantly
- See your entire order before confirming

## Acceptance Criteria
**Menu Browsing & Search**
- *Given* I open the app
- - *When* I navigate to the menu screen
- - - *Then* I can browse all available grilled sandwiches and use a search bar to filter by name or ingredient

**Customizing a Menu Item**
- *Given* I select a sandwich from the menu
- - *When* I choose optional fillings, breads, and sauces
- - - *Then* I see the calorie and price totals update in real-time

**Adding to Order**
- *Given* I have customized a sandwich
- - *When* I add it to my order
- - - *Then* the item appears in my current order and the order total (calories + price) is recalculated

**Reviewing the Order**
- *Given* I have added one or more items to my order
- - *When* I open the order summary
- - - *Then* I can view item details, subtotal, and total nutritional information before placing the order

## Tools & Frameworks
| Tech	| Purpose |
| --------- | --------- |
| Swift | Core development language |
| SwiftUI | UI layer for declarative interface building |
| Combine | Reactive state and data flow |
| CoreData | Persistence Framework |
| XCTest | Unit testing for ViewModels and logic |

## Screen Captures

| ![Initial View](/caps/seq1.PNG) | ![Menu View](/caps/seq2.PNG) | ![Search Menu Items](/caps/seq3.PNG) |
| --------- | ---------- | ---------- |
| Initial View | Menu View | Search Menu Items |

| ![Customise View](/caps/seq4.PNG) | ![Select Sauce](/caps/seq5.PNG) | ![Order Updates](/caps/seq6.PNG) |
| --------- | ---------- | ---------- |
| Customise View | Select Sauce | Order Updates |
