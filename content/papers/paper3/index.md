---
title: "Picture Perfect? The Impact of Images in Second-Hand Marketplaces" 
date: 2024-06-14
tags: ["Second hand", "Sustainabilty", "Platforms", "Pre-owned"]
author: ["Luca Rossi"]
# description: "This article explores pricing dynamics and consumer behavior in the second-hand market, emphasizing the significant role of privacy in user interactions and decision-making. It delves into how privacy concerns influence buying and selling practices, impacting overall market efficiency and trust." 
# summary: "This article explores pricing dynamics and consumer behavior in the second-hand market, emphasizing the significant role of privacy in user interactions and decision-making. It delves into how privacy concerns influence buying and selling practices, impacting overall market efficiency and trust." 
description: "This article investigates the role of images in influencing sales outcomes in second-hand marketplaces. By examining pricing strategies and consumer behavior on platforms where users act as micro-entrepreneurs, it evaluates whether sharing personal images enhances sales performance. The analysis also considers the privacy trade-offs of image sharing and explores the factors motivating users to share specific types of images." 
summary: "This article investigates the role of images in influencing sales outcomes in second-hand marketplaces. By examining pricing strategies and consumer behavior on platforms where users act as micro-entrepreneurs, it evaluates whether sharing personal images enhances sales performance. The analysis also considers the privacy trade-offs of image sharing and explores the factors motivating users to share specific types of images." 


---

##### Download

+ [Presentation](https://lrossi95.github.io/papers/paper3/presentation.pdf)
+ [Draft](https://lrossi95.github.io/papers/paper3/main.pdf)

### Introduction
This paper investigates the monetary value of privacy in second-hand clothing markets. It aims to analyse how privacy considerations shape consumer behaviour and influence market transactions, with a specific focus on the role of image sharing in driving sales and fostering trust.

### Research Objective

The primary goal of this research is to explore how the use of personal images, professional models, or catalogue images compares to simple product photos in influencing sales outcomes. Specifically, the study aims to answer:
- What drives a user to choose one type of picture over another?
- How does the effort invested in pictures affect sales outcomes?

### Methodological Approach

To achieve this, the research utilizes a robust dataset from a popular second-hand clothing platform, Tise. This dataset includes detailed information on the items on sale, user characteristics, and reviews. A key aspect of the study involves analysing the behaviour of consumers when they decide whether to include personal images (such as photos of themselves wearing the clothes) in their listings.

Additional variables were created to enhance the analysis:
1. **Profile picture variables:** Presence of a person in the picture and assessment of perceived attractiveness.
2. **Ad image categorization:** Categorizing images into Homemade Picture, Real Person, Catalogue Image, or Professional Model.
3. **Ad picture quality:** Evaluating the quality of the images used, using No Reference Image Quality Metrics (IQA).

### Data Analysis

- **Logit Regression:** This statistical method was applied to examine the drivers influencing the choice of picture category and the subsequent sales outcomes. The analysis focuses on understanding the economic impact of listing image choices, particularly in relation to privacy concerns.

1. **Privacy Valuation:**
   - Measuring the implicit value users place on privacy regressing sales on image category, controlling for other as and users' characteristics.

2. **Consumer Decision-Making:**
   - Exploring the decision-making processes behind why sellers include personal photos in their listings.

### Results

#### Dependent Variable: Sold Outcome (0/1)

| Category              | Full Sample    | Sweaters        | Tops           | Pants          | Dresses        | Jackets        |
|-----------------------|----------------|-----------------|----------------|----------------|----------------|----------------|
| **Real Person**       | 0.039          | -0.124***       | -0.023         | -0.137***      | 0.352***       | 0.006          |
|                       | (0.111)        | (0.013)         | (0.017)        | (0.013)        | (0.011)        | (0.015)        |
| **Catalogue Image**   | 0.212***       | 0.122***        | 0.365***       | -0.043**       | 0.352***       | 0.234***       |
|                       | (0.076)        | (0.020)         | (0.026)        | (0.022)        | (0.019)        | (0.020)        |
| **Professional Model**| 0.230          | 0.050***        | 0.079***       | 0.002          | 0.585***       | 0.185***       |
|                       | (0.142)        | (0.018)         | (0.020)        | (0.013)        | (0.012)        | (0.019)        |
| **Number of Images**  | 0.049***       | 0.070***        | 0.042***       | 0.052***       | 0.039***       | 0.055***       |
|                       | (0.006)        | (0.005)         | (0.007)        | (0.005)        | (0.004)        | (0.005)        |

**Controls:** ✓  
**Years:** 2023  
**Fixed Effects:** Product Category


The analysis reveals key insights into how different image types influence sales outcomes across various categories of second-hand clothing. The regression results, summarized in the table above, provide a nuanced understanding of these dynamics:

1. **Impact of Real Person Images**:  
   - Listings featuring images of real people wearing the items yielded mixed results. While these images positively influenced sales for dresses (0.352***), they had a significant negative effect on categories like sweaters (-0.124***) and pants (-0.137***). This suggests that the perceived authenticity of real-person images resonates more with certain product types, such as dresses, where fit and presentation may be more visually impactful.

2. **Catalogue Images**:  
   - Catalogue-style images consistently delivered positive outcomes across most categories. For instance, the use of catalogue images significantly boosted sales of tops (0.365***), jackets (0.234***), and dresses (0.352***). These results indicate that professional, standardized imagery aligns well with consumer expectations for quality and reliability in these categories.

3. **Professional Model Images**:  
   - Professional model images were particularly effective for dresses (0.585***) and jackets (0.185***), highlighting their value in presenting clothing in an aspirational context. However, their impact was less pronounced or neutral for other categories, such as pants and sweaters, where fit and texture may be less reliant on high-end presentation.

4. **Number of Images**:  
   - The total number of images in a listing had a universally positive impact across all categories. For example, each additional image increased the likelihood of a sale, with coefficients such as 0.070*** for sweaters and 0.052*** for pants. This finding underscores the importance of comprehensive visual representation in online marketplaces.

5. **Category-Specific Trends**:  
   - The effectiveness of image types varies significantly between categories. Dresses and jackets appear to benefit the most from professional and catalogue images, while pants and sweaters see limited or negative effects from real-person photos.

### Implications of Results

These findings highlight the strategic importance of tailoring image types to specific product categories in second-hand marketplaces. The data suggests that while professional and catalogue images often enhance sales outcomes, real-person photos can be effective in certain contexts where authenticity and fit are prioritized, such as dresses. Additionally, the strong positive effect of image quantity emphasizes the value of providing multiple views to potential buyers.

By leveraging these insights, sellers can optimize their listing strategies to align with consumer preferences, while platform operators might consider offering tools or guidelines to help users select the most effective image types for their listings.

<!-- ### Introduction
This paper investigates the monetary value of privacy in second-hand clothing markets. It aims to analyze how privacy considerations shape consumer behaviour and influence market transactions, with a specific focus on the role of image sharing in driving sales and fostering trust.

### Research Objective

The primary goal of this research is to explore how the use of personal images, professional models, or catalogue images compares to simple product photos in influencing sales outcomes. Specifically, the study aims to answer:

What drives a user to choose one type of picture over another?

How does the effort invested in pictures affect sales outcomes?

### Methodological Approach

To achieve this, the research utilizes a robust dataset from a popular second-hand clothes platform, Tise. This dataset includes detailed information on the item on sale, user characteristics, and reviews. A key aspect of the study involves analysing the behaviour of consumers when they decide whether to include personal images (such as photos of themselves wearing the clothes) in their listings:

To address this, additional variables were created:
    1. Profile picture variables: person in the picture, beauty.
    2. Ad image belonging to following categories: Homemade Picture, Real Person, Catalogue Image, Professional Model.
    3. Ad picture quality

Data Analysis:
- Logit regression was used to understand firstly to understand the drivers for chosing a picture category instead of another and the drivers of sales outcomes. Specifically, the impact of the listing image chosen. This analysis aims to quantify the impact of privacy concerns on economic outcomes.
2.	Privacy Valuation:
- The research will attempt to measure the implicit value users place on privacy by observing variations in listing prices and sale rates between listings with personal images and those without. This will help determine if there is a premium or discount associated with privacy-related behaviors.
- Investigation into user engagement metrics such as the number of views, time on market, and likelihood of repeat transactions as functions of privacy considerations.
3.	Consumer Decision-Making:
- An examination of the decision-making process behind how and why sellers choose to include personal photos in their listings. Factors such as demographic data, privacy concerns, and perceived benefits of including such images will be considered.

### Preliminary Outcomes

The anticipated findings of this research are expected to contribute significantly to the understanding of the second-hand market’s dynamics, particularly how privacy influences economic behavior and market trust. By explicitly quantifying the value of privacy, the study aims to provide insights that could inform both consumers and platform operators, potentially leading to enhanced policies that protect user privacy while maintaining or improving market efficiency. -->

