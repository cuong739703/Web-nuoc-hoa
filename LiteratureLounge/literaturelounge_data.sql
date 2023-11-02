-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2023 lúc 02:47 PM
-- Phiên bản máy phục vụ: 8.0.29
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `literaturelounge_data`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `admin_id` int NOT NULL,
  `admin_loginname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_email` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_fullname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_phone` varchar(12) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`admin_id`, `admin_loginname`, `admin_password`, `admin_email`, `admin_fullname`, `admin_address`, `admin_phone`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'nguyenvana@gmail.com', 'Nguyễn Văn A', 'Hà Nội', '0987654321');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcart`
--

CREATE TABLE `tblcart` (
  `cart_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcart`
--

INSERT INTO `tblcart` (`cart_id`, `user_id`) VALUES
(1, 1),
(10, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcart_details`
--

CREATE TABLE `tblcart_details` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcategory`
--

CREATE TABLE `tblcategory` (
  `category_id` int NOT NULL,
  `category_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcategory`
--

INSERT INTO `tblcategory` (`category_id`, `category_name`) VALUES
(1, 'Novels'),
(2, 'History Books'),
(3, 'Science Books');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcomment`
--

CREATE TABLE `tblcomment` (
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `comment_content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `comment_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcomment`
--

INSERT INTO `tblcomment` (`comment_id`, `user_id`, `product_id`, `comment_content`, `comment_time`) VALUES
(2, 1, 2, 'Hay', '2023-08-08 08:38:42'),
(3, 1, 3, 'Hay', '2023-08-20 21:15:49'),
(14, 1, 9, 'Hay', '2023-10-15 16:43:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblmomo`
--

CREATE TABLE `tblmomo` (
  `momo_id` int NOT NULL,
  `PartnerCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `OrderId` int NOT NULL,
  `Amount` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `OrderInfo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `OrderType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `TransId` int NOT NULL,
  `payType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblmomo`
--

INSERT INTO `tblmomo` (`momo_id`, `PartnerCode`, `OrderId`, `Amount`, `OrderInfo`, `OrderType`, `TransId`, `payType`, `order_code`) VALUES
(10, 'MOMOBKUN20180529', 1696686623, '35600', 'Thanh toán qua MoMo ATM', 'momo_wallet', 2147483647, 'napas', 5238);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblorder`
--

CREATE TABLE `tblorder` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_created_time` datetime NOT NULL,
  `order_address` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `order_notes` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `order_value` float NOT NULL,
  `order_phone` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `order_receiver` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_payment` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_code` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblorder`
--

INSERT INTO `tblorder` (`order_id`, `user_id`, `order_created_time`, `order_address`, `order_notes`, `order_value`, `order_phone`, `order_status`, `order_receiver`, `order_payment`, `order_code`) VALUES
(16, 1, '2023-10-07 20:28:26', 'Hà Nội', '', 18000, '0362046866', 1, 'Nguyễn Văn A', 'vnpay', 6956),
(17, 1, '2023-10-07 20:51:36', 'Hà Nội', '', 35600, '0987654321', 1, 'Nguyễn Văn A', 'momo', 5238),
(18, 1, '2023-10-13 21:43:31', 'Hà Nội', '', 18000, '0123456789', 1, 'Nguyễn Văn A', 'cod', 9802),
(19, 1, '2023-10-15 16:06:28', 'Hà Nội', '', 18000, '0123456789', 1, 'Nguyễn Văn A', 'vnpay', 1591),
(21, 10, '2023-10-15 20:18:09', 'Hà Nội', '', 351000, '0123456789', 1, 'Nguyễn Văn B', 'cod', 1699),
(22, 10, '2023-10-15 20:18:49', 'Hà Nội', '', 171000, '0123456789', 1, 'Nguyễn Văn B', 'vnpay', 5369),
(23, 10, '2023-10-15 20:40:56', 'Hà Nội', '', 741000, '0123456789', 1, 'Nguyễn Văn B', 'cod', 5001);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblorder_details`
--

CREATE TABLE `tblorder_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_code` int DEFAULT NULL,
  `purchase_price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblorder_details`
--

INSERT INTO `tblorder_details` (`order_id`, `product_id`, `quantity`, `order_code`, `purchase_price`) VALUES
(16, 8, 1, 6956, 18000),
(17, 7, 1, 5238, 17600),
(17, 8, 1, 5238, 18000),
(18, 8, 1, 9802, 18000),
(19, 8, 1, 1591, 18000),
(21, 8, 1, 1699, 180000),
(21, 9, 1, 1699, 171000),
(22, 13, 1, 5369, 171000),
(23, 12, 2, 5001, 285000),
(23, 13, 1, 5001, 171000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblproduct`
--

CREATE TABLE `tblproduct` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `product_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` float NOT NULL,
  `product_image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `product_discount` float NOT NULL,
  `product_author` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblproduct`
--

INSERT INTO `tblproduct` (`product_id`, `category_id`, `product_title`, `product_description`, `product_price`, `product_quantity`, `product_image`, `product_discount`, `product_author`) VALUES
(1, 1, 'Brave New World', 'One of the giants of the dystopian genre. Having already shaken up the literary world when it was first published, Brave New World is relevant even today as it urges readers to ask questions about autonomy, hedonism, and our definition of “utopia.”', 50000, 99, 'bravenewworld.jpg', 5, 'Aldous Huxley'),
(2, 1, 'The Book Thief', 'This book has an unmistakably distinct narrator — Death. Set in Nazi Germany, it follows Liesel, a young girl in her new foster care home. As the world around her begins to crumble, Liesel must find solace in books and the power of words.', 35000, 100, 'thebookthief.jpg', 5, 'Markus Zusak'),
(3, 1, 'As I Lay Dying', 'As William Faulkner attested: “I set out deliberately to write a tour-de-force. Before I ever put pen to paper and set down the first word I knew what the last word would be and almost where the last period would fall.” This is the grueling story of the Bundren family’s slow, tortuous journey to bury Addie, their wife and mother, in her hometown of Mississippi...', 36000, 100, 'asilaydying.jpg', 10, 'William Faulkner'),
(4, 1, 'Anna Karenina', 'If you like lengthy books in which to immerse yourself, then this is a real treat. This epic novel tells the parallel stories of Anna Karenina and Konstantin Levin over a span of 800+ pages — dealing with social change, politics, theology, and philosophy in nineteenth-century Russia all the while.', 180000, 99, 'annakarenina.jpg', 10, 'Leo Tolstoy'),
(5, 1, 'Animal Farm', 'When Old Major the boar dies on Manor Farm, two young pigs named Snowball and Napoleon rise to create new leadership in this allegorical book that is supposed to mirror the Russian Revolution of 1917 — and the ensuing Stalinist Soviet Union. Animal Farm is a stunning achievement, and not just because Orwell proved that a story about pigs can be terrifying.', 180000, 100, 'animalfarm.jpg', 10, 'George Orwell'),
(6, 1, 'The Aleph and Other Stories', 'Jorge Luis Borges’ keen insight and philosophical wisdom is on full display in this acclaimed short story collection. From “The Immortal” to “The House of Asterion,” the stories within are glittering, haunting examples of worlds created by a master of magic realism.', 20000, 100, 'thealephandotherstories.jpg', 10, 'Jorge Luis Borges'),
(7, 1, 'The Alchemist', 'Written in only two weeks, The Alchemist has sold more than two million copies worldwide — and the magical story of Santiago’s journey to the pyramids of Egypt continues to enchant readers worldwide. A dreamy triumph.', 200000, 99, 'thealchemist.jpg', 12, 'Paulo Coelho'),
(8, 1, 'The Adventures of Sherlock Holmes', 'In 1891, Sir Arthur Conan Doyle published “A Scandal in Bohemia,” the first short story to feature Sherlock Holmes. Sharp and engrossing, this collection shows how exactly Sherlock Holmes became a cultural phenomenon and the most recognizable detective of all time.', 200000, 96, 'theadvanturesofsherlockholmes.jpg', 10, 'Arthur Conan Doyle'),
(9, 1, 'Nước hoa Coach Green EDT', 'Bản thân Coach Green EDT không phức tạp, nhưng nó vẫn có cho mình một nét đẹp rất riêng. Ở tầng hương đầu, Coach Green EDT mang đến những nốt hương thú vị của cam Bergamot, kiwi, toát lên năng lượng và sự hưng phấn. Chuyên gia mùi hương Marie Salamagne đắm mình trong ký ức về thiên nhiên tươi tốt. Cô muốn phản ánh khoảnh khắc mà thời gian dường như dừng lại khi bạn bước vào công viên và tiếng ồn ào của thành phố biến mất. Ở tầng hương giữa, hương nước hoa được nhấn mạnh bởi hương thảo và hoa phong lữ, tạo nên bầu không khí thoải mái, ve vuốt khứu giác. Sau đó, hương cuối được tôi luyện bởi rêu pha lê đất và gỗ tuyết tùng đầy nam tính.', 2000000, 94, '4.webp', 25, 'Coach'),
(12, 1, 'Nước hoa Montblanc Explorer Platinum EDP', 'Montblanc Explorer Platinum EDP bắt đầu với lá violet, tạo ra một mùi thơm tươi mát và tinh tế. Hương lá violet mang đến sự rạng rỡ và sự sảng khoái, tạo ra một cảm giác tỉnh táo và tràn đầy năng lượng. Tiếp theo, hương giữa của chai nước hoa đầy sức sống với sự góp mặt của xô thơm. Hương thơm của Xô thơm mang đến một mùi hương độc đáo, đầy mê hoặc và quyến rũ. Đây là một thành phần hương liệu quan trọng, mang đến một sự tinh tế và sự cân bằng cho Montblanc Explorer Platinum EDP. Cuối cùng, Montblanc Explorer Platinum EDP thật nổi bật với gỗ tuyết tùng. Hương cây tuyết tùng mang đến sự mạnh mẽ và bền bỉ, tạo nên một sự cuốn hút và nam tính cho mùi hương. Không những thế, tuyết tùng cũng giúp mùi hương thêm ấm áp và trầm lắng, tạo nên một sự lưu lại lâu dài và đáng nhớ.', 3000000, 98, '3.webp', 20, 'Mont Blanc'),
(13, 1, 'Nước hoa Hugo Boss Boss Bottled Parfum', 'Hugo Boss Boss Bottled Parfum mở đầu đầy ấn tượng với mùi hương từ nốt trái cây đầy sảng khoái. Hương thơm tươi tắn của cam quýt mang đến cảm giác rất kích thích khứu giác. Thêm thắt một chút hương thơm ngọt dịu của nhựa thơm Olibanum. Tất cả hoà vào nhau tạo nên tầng hương đầu vô cùng độc đáo. ', 1800000, 98, '2.jpg', 30, 'Hugo Boss'),
(14, 1, 'AZZARO CHROME EXTREME EDP', 'Được giới thiệu lần đầu vào năm 2020, Azzaro Chrome Extreme EDP là sản phẩm nước hoa của thương hiệu nổi tiếng Azzaro. Mùi hương nước hoa với tông hương chủ đạo là cam chanh thơm ngát nêu bật phong thái tươi mới, năng lượng và tràn đầy nguồn tích cực cho phái mạnh. Sự phóng khoáng, tự do đầy thách thức được lột tả đầy tinh tế trong làn hương của Azzaro Chrome Extreme EDP.\r\n\r\n', 1187000, 23, '1.jpg', 10, 'Azzaro');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int NOT NULL,
  `user_loginname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_phone` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `user_created_date` date NOT NULL,
  `user_enabled` tinyint(1) DEFAULT '1',
  `user_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `user_loginname`, `user_password`, `user_email`, `user_fullname`, `user_address`, `user_phone`, `user_created_date`, `user_enabled`, `user_deleted`) VALUES
(1, 'a', '202cb962ac59075b964b07152d234b70', 'nguyenvana@gmail.com', 'Nguyễn Văn A', 'Hà Nội', '0123456789', '2023-07-18', 1, 0),
(10, 'b', '202cb962ac59075b964b07152d234b70', 'nguyenvanb@gmail.com', 'Nguyễn Văn B', 'Hà Nội', '0123456789', '2023-10-15', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblvnpay`
--

CREATE TABLE `tblvnpay` (
  `vnpay_id` int NOT NULL,
  `Amount` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `BankCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `BankTranNo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `CardType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `OrderInfo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `PayDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `TmnCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `TransactionNo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `order_code` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblvnpay`
--

INSERT INTO `tblvnpay` (`vnpay_id`, `Amount`, `BankCode`, `BankTranNo`, `CardType`, `OrderInfo`, `PayDate`, `TmnCode`, `TransactionNo`, `order_code`) VALUES
(13, '1800000', 'NCB', 'VNP14135450', 'ATM', 'Thanh toan GD:6956', '20231007203035', '6448J9KM', '14135450', 6956);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tblcart_details`
--
ALTER TABLE `tblcart_details`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tblmomo`
--
ALTER TABLE `tblmomo`
  ADD PRIMARY KEY (`momo_id`);

--
-- Chỉ mục cho bảng `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tblorder_details`
--
ALTER TABLE `tblorder_details`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `tblvnpay`
--
ALTER TABLE `tblvnpay`
  ADD PRIMARY KEY (`vnpay_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tblcomment`
--
ALTER TABLE `tblcomment`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tblmomo`
--
ALTER TABLE `tblmomo`
  MODIFY `momo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tblvnpay`
--
ALTER TABLE `tblvnpay`
  MODIFY `vnpay_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tblcart`
--
ALTER TABLE `tblcart`
  ADD CONSTRAINT `tblcart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbluser` (`user_id`);

--
-- Các ràng buộc cho bảng `tblcart_details`
--
ALTER TABLE `tblcart_details`
  ADD CONSTRAINT `tblcart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `tblcart` (`cart_id`),
  ADD CONSTRAINT `tblcart_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tblproduct` (`product_id`);

--
-- Các ràng buộc cho bảng `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD CONSTRAINT `tblcomment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbluser` (`user_id`),
  ADD CONSTRAINT `tblcomment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tblproduct` (`product_id`);

--
-- Các ràng buộc cho bảng `tblorder`
--
ALTER TABLE `tblorder`
  ADD CONSTRAINT `tblorder_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbluser` (`user_id`);

--
-- Các ràng buộc cho bảng `tblorder_details`
--
ALTER TABLE `tblorder_details`
  ADD CONSTRAINT `tblorder_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tblorder` (`order_id`),
  ADD CONSTRAINT `tblorder_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tblproduct` (`product_id`);

--
-- Các ràng buộc cho bảng `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD CONSTRAINT `tblproduct_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tblcategory` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
