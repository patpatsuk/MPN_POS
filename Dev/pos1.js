function navigateTo(url) {
     window.location.href = url;
}

function toggleMenu() {
    const menuIcon = document.getElementById('menu-icon');
    const tabBar = document.getElementById('tab-bar');
    const contentArea = document.getElementById('content-area');
    if (tabBar.classList.contains('show')) {
        tabBar.classList.remove('show');
        contentArea.classList.remove('tab-open');
        menuIcon.textContent = '☰';
    } else {
        tabBar.classList.add('show');
        contentArea.classList.add('tab-open');
        menuIcon.textContent = '✕';
    }
}

function updateTime() {
    const now = new Date();
    const date = now.toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' });
    const time = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit', timeZoneName: 'short' });
    document.getElementById('date-time').textContent = `${date} | ${time}`;
}

function loadContent(url) {
    fetch(url)
        .then(response => response.text())
        .then(html => {
            document.getElementById('content-area').innerHTML = html;
        })
        .catch(error => console.error('Error loading content:', error));
}

function filterProducts(category) {
    const allProducts = document.querySelectorAll('.product');
    allProducts.forEach(product => {
        if (product.innerText.includes(category)) {
            product.style.display = 'block';
        } else {
            product.style.display = 'none';
        }
    });
}


function showModal() {
document.getElementById('transactionModal').style.display = 'flex'; // Show the modal
}

function closeModal() {
document.getElementById('transactionModal').style.display = 'none'; // Hide the modal
}

const cartItems = [];

function addToCart(name, price, imgSrc) {
const existingItem = cartItems.find(item => item.name === name);
if (existingItem) {
existingItem.quantity += 1;
 } else {
cartItems.push({ name, price, quantity: 1, imgSrc }); // Add imgSrc to the item object
    }
renderCart();
}

function renderCart() {
const cartElement = document.querySelector('.cart-items');
cartElement.innerHTML = '';
cartItems.forEach(item => {
const cartItem = document.createElement('div');
cartItem.classList.add('cart-item');
cartItem.innerHTML = `
    <img src="${item.imgSrc}" alt="${item.name}" style="width: 50px; height: 50px; margin-right: 10px;"> <!-- Display the image -->
    <div>
         <p>${item.name}<br><span style="color: #B41513;">${item.price.toFixed(2)} บาท</span></p>
        <div class="quantity-control">
            <button onclick="updateQuantity('${item.name}', -1)">-</button>
            <span>${item.quantity}</span>
            <button onclick="updateQuantity('${item.name}', 1)">+</button>
        </div>
    </div>
    <img src="./Asset/bin.svg" alt="Delete" class="delete-icon" onclick="removeFromCart('${item.name}')">
`;
cartElement.appendChild(cartItem);
});
updateSummary();
}

function removeFromCart(itemName) {
    const index = cartItems.findIndex(item => item.name === itemName);
    if (index > -1) {
        cartItems.splice(index, 1); // Remove the item from the array
        renderCart(); // Re-render the cart to update the UI
    }
}


function updateQuantity(name, change) {
    const item = cartItems.find(item => item.name === name);
    if (item) {
        item.quantity += change;
        if (item.quantity <= 0) {
            const index = cartItems.indexOf(item);
            cartItems.splice(index, 1);
        }
    }
    renderCart();
}

function updateSummary() {
    const total = cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const discount = 0; // Calculate discount if applicable
    const grandTotal = total - discount;
    
    // Update summary in cart
    document.querySelector('.summary p:nth-child(1)').textContent = `ยอดรวม: ${total.toFixed(2)} บาท`;
    document.querySelector('.summary p:nth-child(2)').textContent = `ส่วนลด: -${discount.toFixed(2)} บาท`;
    document.querySelector('.summary p:nth-child(3)').textContent = `ทั้งหมด: ${grandTotal.toFixed(2)} บาท`;
    
    // Update summary in modal
    document.getElementById('totalPrice').textContent = `ยอดรวม: ${total.toFixed(2)} บาท`;
    document.getElementById('discount').textContent = `ส่วนลด: -${discount.toFixed(2)} บาท`;
    document.getElementById('grandTotal').textContent = `ทั้งหมด: ${grandTotal.toFixed(2)} บาท`;
    }
    
    
    function checkBill() {
       updateSummary();
        document.getElementById('transactionModal').style.display = 'flex';
    }

function selectPaymentMethod(method) {
const numpad = document.getElementById('numpad');
if (method === 'cash') {
numpad.style.display = 'flex'; // Shows the numpad with flex layout
} else {
numpad.style.display = 'none'; // Hides the numpad
 }
}

function inputCash(num) {
    const cashInput = document.getElementById('cashInput');
    cashInput.value = cashInput.value + num;
}

function clearCash() {
    document.getElementById('cashInput').value = '';
}

function calculateChange() {
    const cashInput = document.getElementById('cashInput').value;
    const total = parseFloat(document.querySelector('.summary p:nth-child(3)').textContent.split(': ')[1]);
    const change = cashInput - total;
    document.getElementById('changeDisplay').textContent = `เงินทอน: ${change.toFixed(2)} บาท`;
}

function cancelTransaction() {
console.log("Transaction cancelled.");
closeModal(); // Assuming you want to close the modal on cancellation
}

function confirmTransaction() {
    console.log("Transaction confirmed.");

    // Hide the numpad
    document.getElementById('numpad').style.display = 'none';
    closeModal();

    // Increment and update receipt number
    updateReceiptNumber();
}

function updateReceiptNumber() {
    // Assuming receipt number is stored and updated in a simple numeric format
    let currentNumber = document.getElementById('receipt-number').textContent;
    let number = parseInt(currentNumber.replace('#', '')); // Remove the '#' and convert to integer
    let newNumber = number + 1; // Increment the receipt number

    // Update the UI
    document.getElementById('receipt-number').textContent = '#' + newNumber.toString().padStart(4, '0'); // Pad the number with zeros
}      
window.onload = function() {
    updateTime();
    setInterval(updateTime, 1000);
   
    document.querySelectorAll('.tab-button').forEach(button => {
        button.addEventListener('click', function() {
            document.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
        });
    });

    document.querySelectorAll('.category').forEach(category => {
        category.addEventListener('click', function() {
            document.querySelectorAll('.category').forEach(cat => cat.classList.remove('selected'));
            this.classList.add('selected');
        });
    });
}
