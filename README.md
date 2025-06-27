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

## Architecture
The app follows the MVVM (Model–View–ViewModel) architecture pattern, ensuring testability and separation of concerns.
```
Samijz
├── Models
│   └── MenuItem, Ingredient, OrderItem (Codable)
├── ViewModels
│   ├── MenuViewModel
│   └── OrderViewModel
├── Views
│   ├── MenuListView
│   ├── MenuItemDetailView
│   ├── CustomisationView
│   └── OrderSummaryView
├── Services
│   └── MenuDataProvider.swift
├── Persistence
│   └── OrderStore.swift
└── Tests
    └── GrillaTests.swift
```
**Class Diagram**
```
┌────────────────────────────┐
│ MenuItem                   │
├────────────────────────────┤
│ +name                      │
│ +basePrice                 │
│ +baseCal                   │
│ +ingredients: [Ingredient] │
└────┬───────────────────────┘
     │
     │ has
     ▼
┌──────────────┐
│ Ingredient   │
├──────────────┤
│ +name        │
│ +price       │
│ +calories    │
│ +isOptional  │
└──────────────┘

┌────────────────────────────────────┐
│ OrderItem                          │
├────────────────────────────────────┤
│ +menuItem                          │
│ +selectedIngredients: [Ingredient] │
│ +totalPrice                        │
│ +totalCal                          │
└────┬───────────────────────────────┘
     │ wraps
     ▼

┌─────────────────────┐
│   Order             │
├─────────────────────┤
│ +items: [OrderItem] │
│ +totalPrice         │
│ +totalCal           │
└─────────────────────┘

┌───────────────────────┐         ┌────────────────────┐
│  MenuViewModel        │         │  OrderViewModel    │
├───────────────────────┤         ├────────────────────┤
│ +menuItems: [MenuItem]│         │ +order: Order      │
│ +search()             │         │ +addItem()         │
└─────────┬─────────────┘         └─────────┬──────────┘
          │                                 │ persists
          ▼                                 ▼
                                 ┌────────────────────┐
                                 │    OrderStore      │
                                 ├────────────────────┤
                                 │ +save(order)       │
                                 │ +load()            │
                                 └────────────────────┘
```
## Navigation
```
Start
  │
  ▼
┌────────────────────┐
│ MenuListView       │
│ - List of items    │
│ - Search bar       │
└────────┬───────────┘
         │ tap item
         ▼
┌──────────────────────────┐
│ MenuItemDetailView       │
│ - Shows description      │
│ - Button: "Customize"    │
└────────┬─────────────────┘
         │ tap customize
         ▼
┌──────────────────────────┐
│ CustomisationView        │
│ - Ingredient selection   │
│ - Real-time cost + cals  │
│ - Add to order button    │
└────────┬─────────────────┘
         │ added to order
         ▼
┌──────────────────────────┐
│ OrderSummaryView         │
│ - List of order items    │
│ - Totals (calories/cost) │
│ - Place order button     │
└──────────────────────────┘
```
## Screen Captures

| ![Initial View](/caps/seq1.PNG) | ![Menu View](/caps/seq2.PNG) | ![Search Menu Items](/caps/seq3.PNG) |
| --------- | ---------- | ---------- |
| Initial View | Menu View | Search Menu Items |

| ![Customise View](/caps/seq4.PNG) | ![Select Sauce](/caps/seq5.PNG) | ![Order Updates](/caps/seq6.PNG) |
| --------- | ---------- | ---------- |
| Customise View | Select Sauce | Order Updates |

## Future Enhancements
- [ ] CloudKit support for syncing orders across devices
- [ ] Order history and re-ordering
- [ ] Admin backend for managing the menu
- [ ] User login for favourites and nutrition tracking
