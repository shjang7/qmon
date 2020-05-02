// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap'
import '../stylesheets/application'

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()

  const customAlert = document.querySelector('.alert');
  if (customAlert) setTimeout(() => { customAlert.style.display = 'none'; }, 4000);

  const reviewsToggle = document.getElementById('reviews-toggle');
  const productItemsToggle = document.getElementById('product-items-toggle');

  const reviews = document.querySelector('#reviews');
  const productItems = document.querySelector('#product-items');

  const toggleTap = (first, second) => {
    first.classList.remove('d-none');
    second.classList.add('d-none');
  }

  const toggleColor = (first, second) => {
    first.classList.add('btn-orange');
    second.classList.remove('btn-orange');
  }

  if (productItemsToggle) {
    productItemsToggle.addEventListener('click', () => {
      toggleTap(productItems, reviews);
      toggleColor(productItemsToggle, reviewsToggle);
    });
  }

  if (reviewsToggle) {
    reviewsToggle.addEventListener('click', () => {
      toggleTap(reviews, productItems);
      toggleColor(reviewsToggle, productItemsToggle);
    });
  }
})


// import { Application } from "stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"
//
// const application = Application.start()
// const context = require.context("../controllers", true, /\.js$/)
// application.load(definitionsFromContext(context))

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"
