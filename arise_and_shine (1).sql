-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 10:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arise_and_shine`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_body` text NOT NULL,
  `blog_author` varchar(100) NOT NULL,
  `blog_image` varchar(255) NOT NULL,
  `blog_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_title`, `blog_body`, `blog_author`, `blog_image`, `blog_time`) VALUES
(6, 'Arise and Shine CBO: Building a More Inclusive and Empowered Society in Kericho, Kenya', '<p>In a world where people with disabilities and neurodevelopmental disorders often face stigma, marginalization, and limited access to support systems, community-based organizations play a pivotal role in bridging the gap between need and inclusion. Arise and Shine CBO, a non-political and non-profit organization located in Kericho County, Kenya, stands out as a transformative force dedicated to advocating for the rights, dignity, and empowerment of individuals with disabilities and their families.</p>\r\n\r\n<p>Established in 2023 and formally registered in March 2024 under the Directorate of Social Development of Kericho County, Arise and Shine CBO is strategically based in Duka Moja, near the Reformed Baptist Church. With a registration certificate number DSD/35/190/02/13754, the organization is firmly rooted in the local community while addressing issues of national importance. Its mission is clear: to promote inclusivity through education, advocacy, and hands-on community support that directly improves the quality of life for its beneficiaries.</p>\r\n\r\n<h3><strong>Vision, Mission, and Core Values</strong></h3>\r\n\r\n<p>Arise and Shine CBO envisions a society where every individual, regardless of ability or disability, enjoys equal opportunities, access to necessary resources, and a supportive environment conducive to personal and collective growth. The mission reflects this vision by focusing on championing the rights and inclusion of people with disabilities through targeted advocacy, educational outreach, and comprehensive community engagement.</p>\r\n\r\n<p>Central to the organization&rsquo;s identity are its core values. These include:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Empowerment</strong>, which emphasizes building the capacity of individuals and families for long-term self-reliance.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Integrity</strong>, ensuring that all operations are guided by transparency and honesty.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Inclusivity</strong>, which guarantees equal access to opportunities for all members of the community.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Accountability</strong>, with a commitment to the responsible management of resources.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Community Participation</strong>, highlighting the importance of collaborative engagement to drive sustainable change.<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Programs and Activities Making a Real Difference</strong></h3>\r\n\r\n<p>One of the organization&#39;s key strengths lies in its diverse programs tailored to meet the specific needs of caregivers and people living with disabilities. Arise and Shine CBO provides <strong>vocational training programs</strong> that help caregivers acquire practical and income-generating skills based on their interests and existing abilities. These include training in peanut butter production, as well as the manufacturing of reusable diapers and sanitary towels using locally available materials. These initiatives not only promote economic independence but also build confidence and a sense of purpose among caregivers who might otherwise remain financially dependent.</p>\r\n\r\n<p>Another significant achievement of the organization is its investment in <strong>childcare and occupational therapy services</strong>. Through a team of trained volunteers and social workers, beneficiaries receive essential care services that support their physical and developmental needs. These services are particularly impactful for children with neurodevelopmental disorders, providing a structured and compassionate environment for therapy and social interaction.</p>\r\n\r\n<p>The organization also prioritizes <strong>awareness and advocacy</strong> to combat stigma and foster inclusion. Community outreach programs focus on educating the public about the challenges faced by individuals with disabilities, especially those with less visible conditions such as autism or developmental delays. By shedding light on these issues and advocating for the rights of children and families, Arise and Shine plays a key role in reshaping societal attitudes and promoting policy changes that protect and empower the disabled community.<br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Governance, Partnerships, and Community Engagement</strong></h3>\r\n\r\n<p>Arise and Shine CBO is led by a structured governance system comprising a chairperson, secretary, treasurer, committee members, and a dedicated team of professional volunteers. This leadership team ensures the organization remains aligned with its mission while maintaining operational efficiency and transparency. Daily activities are managed by a passionate volunteer team who bring a wealth of knowledge and commitment to the cause.</p>\r\n\r\n<p>The organization thrives on <strong>partnerships and collaborations</strong> that enhance its impact. It works closely with local government bodies, non-governmental organizations (NGOs), development partners, faith-based institutions, and international donors. These collaborations enable the organization to scale its programs, secure essential funding, and broaden its reach within and beyond Kericho County.</p>\r\n\r\n<p>The spirit of <strong>community participation</strong> is evident in the organization&#39;s approach to program design and delivery. Local stakeholders are actively involved in decision-making processes, ensuring that programs are culturally relevant and meet the actual needs of the people they aim to serve. This community-driven model reinforces ownership and accountability while fostering long-term sustainability.<br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Achievements and Positive Impact</strong></h3>\r\n\r\n<p>Since its inception, Arise and Shine CBO has made significant strides in uplifting vulnerable members of the community. Its vocational training programs have helped numerous women gain skills that lead to economic independence and improved self-esteem. By offering practical support and emotional assistance, the organization has established a robust <strong>network of services</strong> that families can rely on in times of need.</p>\r\n\r\n<p>Moreover, its <strong>awareness campaigns</strong> have brought visibility to the challenges faced by caregivers and individuals with disabilities. Through media outreach, community meetings, and public events, Arise and Shine continues to champion the message that disability is not inability. These efforts are gradually shifting public perceptions, encouraging more inclusive attitudes, and reducing the isolation often experienced by affected families.</p>\r\n\r\n<p>One of the most notable accomplishments is the organization&rsquo;s successful implementation of <strong>occupational therapy programs</strong>. These programs provide essential support for children with developmental disorders, improving their ability to function in daily life and increasing their chances of educational success. The involvement of trained volunteers ensures that services remain both effective and compassionate.<br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Looking to the Future</strong></h3>\r\n\r\n<p>Arise and Shine CBO is not resting on its achievements. The organization has ambitious plans to expand its reach and deepen its impact. Among its future initiatives is the launch of a <strong>daycare center</strong> specifically designed to support children with disabilities. This facility will not only provide specialized care but also give parents the opportunity to work or pursue training while their children are cared for in a safe and nurturing environment.</p>\r\n\r\n<p>Additionally, the organization aims to develop a full-fledged <strong>vocational training center</strong> for caregivers, enhancing their ability to generate sustainable incomes and reduce dependency. Plans are also underway to <strong>scale up women&rsquo;s economic empowerment projects</strong> and develop a <strong>peanut butter manufacturing company</strong>, turning a grassroots training program into a sustainable social enterprise.</p>\r\n', 'Cetric Samuel', 'bg_1.png', '2025-06-03 00:45:14'),
(9, 'Breaking Barriers: How Arise and Shine CBO is Redefining Disability Inclusion in Kenya', '<p>In Kericho County, Kenya, a quiet revolution is unfolding&mdash;one that challenges stereotypes, breaks down barriers, and redefines what&rsquo;s possible for individuals with disabilities. At the forefront of this movement is&nbsp;<strong>Arise and Shine CBO</strong>, a grassroots organization that&rsquo;s turning compassion into concrete change.</p>\r\n\r\n<h3><strong>The Unseen Struggle</strong></h3>\r\n\r\n<p>Behind Kenya&rsquo;s vibrant communities lies a hidden crisis: families caring for loved ones with disabilities often face isolation, financial strain, and systemic neglect. Many caregivers&mdash;typically mothers&mdash;are forced to abandon income-generating work to provide round-the-clock care. Children with neurodevelopmental disorders frequently miss out on education and socialization opportunities. This is the gap Arise and Shine was created to fill.</p>\r\n\r\n<h3><strong>Innovative Solutions for Real Challenges</strong></h3>\r\n\r\n<p>What sets Arise and Shine apart isn&rsquo;t just their mission&mdash;it&rsquo;s their&nbsp;<em>unconventional approach</em>&nbsp;to solving entrenched problems:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Economic Empowerment Through Unlikely Industries</strong></p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Their peanut butter production training does more than teach a skill&mdash;it transforms caregivers into entrepreneurs using locally available resources.</p>\r\n		</li>\r\n		<li>\r\n		<p>The reusable diaper initiative simultaneously addresses period poverty and creates sustainable businesses for women.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p><strong>Therapy That Comes to You</strong><br />\r\n	Unlike urban-centric programs, Arise and Shine&rsquo;s mobile occupational therapy teams reach remote households, bringing critical services to doorsteps.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Changing Minds Before Changing Policies</strong><br />\r\n	Their awareness campaigns don&rsquo;t just target policymakers&mdash;they engage entire communities through church gatherings, market days, and school meetings, creating cultural shifts from the ground up.</p>\r\n	</li>\r\n</ol>\r\n\r\n<h3><strong>The Ripple Effect</strong></h3>\r\n\r\n<p>The organization&rsquo;s impact can be measured in unexpected ways:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>A mother who once struggled to afford school fees now employs three other caregivers in her peanut butter business.</p>\r\n	</li>\r\n	<li>\r\n	<p>A nonverbal child who couldn&rsquo;t feed himself has learned to communicate through therapy, relieving his aging grandmother&rsquo;s constant worry.</p>\r\n	</li>\r\n	<li>\r\n	<p>Local leaders now consult Arise and Shine when making decisions about disability inclusion&mdash;a radical change from just two years ago.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>The Road Ahead: Big Dreams for Greater Impact</strong></h3>\r\n\r\n<p>With plans to establish a dedicated vocational center and daycare facility, Arise and Shine is poised to scale its model. Their vision includes:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>A &ldquo;Caregiver-to-Caregiver&rdquo;</strong>&nbsp;mentorship network across East Africa</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Disability-inclusive farming cooperatives</strong>&nbsp;to boost food security</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Tech-enabled therapy tools</strong>&nbsp;for remote monitoring of progress</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Why This Matters for All of Us</strong></h3>\r\n\r\n<p>Arise and Shine&rsquo;s work proves that disability inclusion isn&rsquo;t about charity&mdash;it&rsquo;s about unlocking human potential. When caregivers gain economic stability, entire families thrive. When children with disabilities receive therapy, communities learn the value of every member.<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Be Part of the Change</strong><br />\r\n<em>Contact:</em>&nbsp;0710268062 |&nbsp;<a href=\"https://mailto:Kenyaariseandshine@gmail.com/\" target=\"_blank\">Kenyaariseandshine@gmail.com</a><br />\r\n<em>Follow:</em>&nbsp;Facebook @AriseandShineCBO</p>\r\n\r\n<p><a href=\"https://ariseandshinecbo.co.ke/blog\">Back to Blog&nbsp;</a></p>\r\n', 'Cetric Samuel', 'ecbaed482ed94df8b2039fa1c2535d94.png', '2025-06-05 20:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(255) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_subject` varchar(255) NOT NULL,
  `contact_message` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_name`, `contact_subject`, `contact_message`, `contact_email`) VALUES
(1, 'Cetric Samuel', 'Testing', 'This is testing', ''),
(2, 'Cetric Samuel', 'This is testing two', 'Again this is testing two', ''),
(3, 'Cetric Samuel', 'Testing', 'Testing', ''),
(4, 'Cetric Samuel', 'Testing', 'testing', 'peakersdesign@gmail.com'),
(5, 'Cetric Samuel', 'Testing', 'Testing', 'peakersdesign@gmail.com'),
(6, 'Cetric Samuel', 'Testing', 'Why should I be discouraged and I know that He watches over me', 'peakersdesign@gmail.com'),
(7, 'Cetric Samuel', 'Testing', 'Testing', 'scetric@gmail.com'),
(8, 'Cetric Samuel', 'Testing', 'I hope this code works', 'scetric@gmail.com'),
(9, 'Cetric Samuel', 'Testing', 'Please work', 'peakersdesign@gmail.com'),
(10, 'Cetric Samuel', 'Testing', 'Testing', 'scetric@gmail.com'),
(11, 'Cetric Samuel', 'Testing', 'testing', 'fish@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `giving_records`
--

CREATE TABLE `giving_records` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `date_given` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giving_records`
--

INSERT INTO `giving_records` (`id`, `name`, `email`, `phone`, `currency`, `amount`, `purpose`, `date_given`) VALUES
(1, 'Cetric Samuel', 'scetric@gmail.com', '0700391535', 'KES', 1000.00, 'Other', '2025-06-05 21:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriptions`
--

CREATE TABLE `newsletter_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `subscribed_at`) VALUES
(1, 'peakersdesign@gmail.com', '2025-06-03 01:28:48'),
(2, 'scetric@gmail.com', '2025-06-03 10:55:27'),
(3, 'alicia@gmail.com', '2025-06-03 13:17:56'),
(4, 'fish@gmail.com', '2025-06-05 20:19:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `giving_records`
--
ALTER TABLE `giving_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_date` (`date_given`);

--
-- Indexes for table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `giving_records`
--
ALTER TABLE `giving_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
