-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cake`
--
CREATE DATABASE IF NOT EXISTS `cake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cake`;
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `manu_id` int(11) NOT NULL AUTO_INCREMENT,
  `manu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(1, 'Bánh ngọt'),
(2, 'Bánh kem'),
(3, 'Kem plan'),
(4, 'Carament'),
(5, 'pudding'),
(6, 'Phô mai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customerid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `customerid`) VALUES
(4, '2023-12-20 05:46:09', 22),
(5, '2023-12-20 10:39:51', 10),
(6, '2023-12-20 10:39:51', 25),
(9, '2023-12-20 22:05:07', 26),
(10, '2023-12-20 22:16:58', 27),
(11, '2023-12-20 10:40:20', 28);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordersdetail`
--

DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ordersdetail`
--

INSERT INTO `ordersdetail` (`orderid`, `productid`, `quantity`, `price`) VALUES
(4, 115, 5, 325000),
(4, 123, 19, 2337),
(5, 92, 9, 1430000),
(5, 113, 2, 70000),
(5, 101, 1, 89000),
(6, 123, 3, 369),
(7, 92, 2, 260000),
(7, 115, 3, 195000),
(9, 92, 1, 38000),
(10, 92, 21, 798000),
(10, 91, 1, 122000),
(10, 81, 1, 26000),
(11, 82, 10, 675000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `manu_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pro_image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `feature` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receipt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `type_id`, `price`, `pro_image`, `description`, `feature`, `created_at`, `receipt`) VALUES
(82, 'Bánh dâu vị carament', 4, 1, 27000, 'c-feature-1.jpg', 'Bánh chứa hương vị đặc trưng từ lớp kem và tạo hình dễ thương', 0, '2023-11-10 09:46:09', 100),
(81, 'Bánh kem matcha', 4, 1, 26000, 'c-feature-2.jpg', 'Bánh vị ngon thanh mát, thơm mùi trà xanh được trang trí theo dạng Layer. Rất phù hợp với những bạn thích ăn nhiều bánh ít kem. Thơm ngon mà không ngán!', 0, '2023-11-10 09:47:09', 100),
(78, 'Bánh socola', 3, 1, 65000, 'c-feature-3.jpg', 'Bánh chứa hương vị đặc biệt của vị socola', 0, '2023-11-10 09:49:09', 100),
(76, 'Bánh gato nướng', 2, 1, 28000, 'banhgato.jpg', 'Cupcake còn có tên gọi khác là banh 1234 với thành phần nguyên liệu chính là 1 cup bơ, 2 cup đường, 3 cup bột mì, 4 quả trứng gà.', 0, '2023-11-10 09:50:09', 100),
(73, 'Bánh Socola mềm ', 2, 1, 88000, 'c-feature-5.jpg', 'Đặc trưng của loại bánh này là lớp nhân socola mềm và tươi mát.', 1, '2023-11-10 09:52:09', 100),
(71, 'Bánh kem dâu tươi', 2, 1, 269000, 'c-feature-6.jpg', 'Bánh được trang trí độc đáo, tạo hình các bông hoa bằng kem và có vị dâu thơm ngon', 1, '2023-11-10 09:55:09', 100),
(89, 'Bánh sừng bò', 1, 4, 22000, 'banhsungbo.jpg', 'Bánh sừng bò rất nổi tiếng ở Pháp, tuy nhiên nguồn gốc của nó là từ Áo. Loại bánh này còn có tên gọi khác là bánh con cua, với thành phần nguyên liệu làm từ bột mì, sữa, bơ, men và muối', 1, '2023-11-10 09:57:09', 100),
(90, 'Bánh Muffin', 1, 4, 58000, 'muffin.jpg', 'bánh thường được tạo hình trong những chiếc cốc giấy xinh xắn với nhân mặn hoặc ngọt', 1, '2023-11-10 09:58:09', 100),
(91, 'Bánh Coffee cake', 4, 2, 122000, 'coffee.jpg', 'bánh rất thích hợp để phục vụ trong các buổi tiệc trà… được tạo hình trong khuôn tròn, vuông hoặc hình chữ nhật.', 1, '2023-11-10 10:01:09', 100),
(92, 'Bánh Crepes', 5, 3, 38000, 'crepe.jpg', 'bánh crepes thơm ngon và ấn tượng với những hương vị đặc biệt thu hút.', 1, '2023-11-10 10:03:09', 100),
(100, 'Bánh flan', 5, 2, 25000, 'flan2.jpg', 'Loại bánh được chế biến từ việc hấp chín với các nguyên liệu chính là trứng và sữa, nước caramen được gọi là bánh flan', 1, '2023-11-10 10:05:09', 100),
(101, 'Bánh Donut', 1, 2, 89000, 'ngot1.png', 'Bánh Donut được làm bằng socola, đường, kẹo, hạt hạnh nhân...với nhiều màu sắc bắt mắt.', 0, '2023-11-10 10:05:09', 100),
(102, 'Bánh Cheesecake', 6, 2, 120000, 'ngot2.jpg', 'Cheesecake hay còn được gọi là bánh kem phô mai, dù được biến tấu với nhiều phiên bản khác nhau nhưng thành phần chính không thể thiếu cream cheese.', 1, '2023-11-10 10:07:09', 100),
(103, 'Bánh Mousse', 4, 4, 59000, 'ngot3.jpg', 'Mousse là loại bánh chuyên dùng để tráng miệng với phần bánh gato mỏng bên dưới, bên trên là lớp kem chanh leo – cam, chocolate, caramel… mềm mại, mát lạnh.', 1, '2023-11-10 10:09:09', 100),
(105, 'Bánh Tiramisu', 2, 3, 67000, 'ngot4.jpg', 'Tiramisu là loại bánh tráng miệng nổi tiếng của người Ý với vị bánh mềm ẩm, ngọt thanh nhẹ nhàng. Bánh quy Savoiardi, cà phê, phô mai Mascarpone, rượu Rhum, trứng, đường là những nguyên liệu thành phần làm nên bánh tiramisu.', 0, '2023-11-10 10:10:05', 100),
(106, 'Bánh Pound cake', 3, 2, 119000, 'ngot5.jpg', 'Pound cake có hàm lượng chất béo, độ ngọt và bông xốp cao – được tạo hình với khuôn loaf hoặc bundt.', 1, '2023-11-10 10:13:04', 100),
(107, 'Bánh Tart', 2, 3, 62000, 'kem1.jpg', 'Bánh Tart được xem là “anh em họ” của bánh Pie, nhưng khác nhau ở cách tạo hình. Bánh Tart không có phần vỏ trên – được trang trí bằng kem tươi hoặc trái cây.', 1, '2023-11-10 10:15:30', 100),
(108, 'Bánh Pancake', 4, 4, 129000, 'kem2.png', 'Bánh Pancake được làm chín bằng cách tráng một lớp dầu ăn mỏng hoặc quét một lớp bơ lên mặt chào, sau đó cho bột vào – tạo hình dẹt, tròn. Bánh được ăn kèm với mật ong – các loại trái cây tươi hoặc các loại mứt trái cây.', 1, '2023-11-10 10:17:35', 100),
(109, 'Bánh Strawberry', 2, 1, 112000, 'kem3.jpg', 'Bánh xếp xen kẽ giữa kem và dâu tạo nên hương thêm đặc trưng', 0, '2023-11-10 10:20:09', 100),
(110, 'Bánh Black Forest', 2, 1, 350000, 'kem4.jpg', 'Bánh Black Forest của Đức có phần chocolate ẩm và kem tươi xốp xen các lớp trái anh đào. Người Đức cũng thêm vào loại rượu từ quả anh đào tên là Kirsch Wasser, giúp vị ngọt của bánh dịu đi.', 0, '2023-11-10 10:22:39', 100),
(111, 'Bánh Cupcake', 2, 1, 78000, 'kem5.jpg\r\n', 'Bánh dạng nhỏ dùng như một khẩu phần, bánh thường được bao quanh bởi lớp giấy hình cốc xinh xắn, đẹp mắt', 0, '2023-11-10 10:25:29', 100),
(112, 'Bánh Chiffon', 4, 3, 169000, 'cara1.jpg', 'Bánh chiffon có sử dụng dầu ăn để làm thành phần chất béo trong bánh. Cả lòng trắng và lòng đỏ đều được sử dụng nhưng tách riêng trong quá trình làm.', 1, '2023-11-10 10:25:25', 100),
(113, 'Bánh Flan Dâu Tằm', 3, 4, 35000, 'flan2.jpg', 'bánh được hấp chín từ các nguyên liệu chính là trứng, sữa và hương thơm của dâu tằm', 1, '2023-11-10 10:27:09', 100),
(114, 'Bánh Makowiec', 4, 4, 180000, 'trangmieng1.jpg', 'Makowiec là một loại bánh cuộn men ngọt được làm bằng hạt hoa anh túc và có khi cũng được phủ bằng kem.', 0, '2023-11-10 10:29:09', 100),
(115, 'Bánh Brigadeiros', 4, 3, 65000, 'trangmieng2.jpg', 'Brigadeiros là món tráng miệng được chế biến bằng socola bột, sữa đặc và bơ. Bánh có thể được ăn như một khối hỗn hợp nấu chín hoặc có khi được đúc thành từng quả bóng tròn nhỏ bọc đường hạt bên ngoài.', 1, '2023-11-10 10:30:14', 100),
(123, 'aaaaaaaa', 1, 1, 123, 'street_city_movement_135248.jpg-1920x1080.jpg', '123', 1, '2023-11-10 10:35:45', 100);
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Bánh sinh nhật'),
(2, 'Bánh kem mềm'),
(3, 'Bánh tự chọn'),
(4, 'Bánh có sẵn ngon khong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `reviewer_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `reviewer_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `reviewer_name`, `reviewer_email`, `content`, `created_at`) VALUES
(1, 123, 'sieu', 'sieu@gmail.com', 'Banh tam chap nhan duọc', '2023-11-10 00:00:00'),
(2, 115, 'cfsf', 'fdsf@gmail.com', 'fdsf', '2023-11-10 00:00:00'),
(3, 115, 'gdsg', 'fdsf@gmail.com', 'gdfg', '2023-11-10 00:00:00'),
(4, 115, 'nguyen van sieu', 'vansieu@gmail.com', 'Banh rất là ngon cảm thấy hài lòng', '2023-11-10 00:00:00'),
(5, 115, 'nhi123', 'nhi123@gmail.com', 'Tôi thấy bánh ở đây ngon bổ rẻ', '2023-11-10 00:00:00'),
(6, 123, 'Cẩm Nhi', '123', '1', '2023-11-10 00:00:00'),
(7, 123, 'nhi', 'nhi@gmail.com', 'asdad', '2023-11-10 00:00:00'),
(8, 123, 'huy', '', '123', '2023-11-10 00:00:00'),
(9, 123, 'huy123', 'huy123@gmail.com', 'udpate ', '2023-11-10 00:00:00'),
(10, 92, 'aaa', 'aaa@gmail.com', 'bánh dỡ quá', '2023-11-10 00:00:00');


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `permission`) VALUES
(7, 'sieu', '202cb962ac59075b964b07152d234b70', 'Admin'),
(2, 'aaa', '202cb962ac59075b964b07152d234b70', 'User'),
(28, 'camnhi', '202cb962ac59075b964b07152d234b70', 'Admin'),
(32, 'nhi', '202cb962ac59075b964b07152d234b70', 'User'),
(22, 'bahuy', '202cb962ac59075b964b07152d234b70', 'Admin'),
(13, 'huy', '202cb962ac59075b964b07152d234b70', 'User');COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
